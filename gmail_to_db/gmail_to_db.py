from __future__ import with_statement
import base64
import configobj
import email.parser
import imaplib
import logging
import os
import re
import sys

# Set up logging
logging.basicConfig(filename='gmail_to_db.log', level=logging.DEBUG,
                    format='%(asctime)s %(levelname)s %(message)s')
logging.debug('Starting gmail_to_db pull script')

# Global (constant) variables
save_directory = os.getcwd()
lock_dir = os.path.join(os.getcwd(), 'gmail_to_db.lck')
config_filename = 'gmail_to_db.cfg'
config_file = configobj.ConfigObj(config_filename)
user = 'daphotline'
password = base64.b64decode('ZmViMTEyMDEx')

# Check if anyone has the file lock already
try:
    os.mkdir(lock_dir)
except OSError:
    logging.error('Could not get a lock on the lock file. If there are no ',
                  'instances of this script running, delete the lock ',
                  'directory: {dir}'.format(dir=lock_dir))
    sys.exit()

# We've got the lock!
try:
    # connecting to the gmail imap server
    gmail = imaplib.IMAP4_SSL("imap.gmail.com")
    gmail.login(user, password)
    # here you a can choose a mail box like INBOX instead
    gmail.select("[Gmail]/All Mail") 

    # Download the email ids
    ok_response, item_string = gmail.search(None, "ALL")
    if (ok_response != 'OK'):
        logging.error('gmail.search returned error: {err}'.format(
            err=ok_response))
        sys.exit()
    email_ids = map(int, item_string[0].split())

    # Figure out which was the last ID sucessfully processed
    try:
        last_id = int(config_file['last_id'])
    except KeyError:
        logging.error('config_file could not be read')
        sys.exit()
    logging.debug('Found {email_count} email ids, starting at {last_id}'.format(
        email_count=email_ids[-1], last_id=last_id))

    # Check each email after our last id to see if it's a message we want
    for email_id in email_ids[last_id+1:]:
        logging.debug("processing email_id: {id}".format(id=email_id))
        # fetching the mail, "`(RFC822)`" means "get the whole stuff"
        ok_response, data = gmail.fetch(email_id, "(RFC822)") 
        if (ok_response != 'OK'):
            logging.error('gmail.fetch for id {id} returned error: {err}'.
                         format(id=email_id, err=ok_response))
            continue

        # getting the mail content
        email_body = data[0][1]
        mail = email.message_from_string(email_body)

        # Make sure we're looking at an email from phonepeople.com
        if (not re.search('phonepeople.com', mail["From"])):
            logging.debug("The email isn't from phonepeople.com- skipping")
            continue

        # Check each part of the email to retrieve the .wav file
        wav_file = None
        message_body = None
        for part in mail.walk():
            if re.match('audio/wav', part.get('Content-Type')):
                logging.info("We've found a .wav from phonepeople!")
                wav_file = part.get_payload(decode=True)
            if re.match('text/plain', part.get('Content-Type')):
                logging.info("We've found the message body from phonepeople!")
                message_body = part.get_payload(decode=True)
        if (wav_file == None):
            logging.error("We had a email from phonepeople, but never found ",
                          "a .wav")
            sys.exit()
        if (message_body == None):
            logging.error("We had a email from phonepeople, but never found ",
                          "a message body")
            sys.exit()

        # Parse out relevent info from the message body
        message = {}
        message['time_received'] = re.search(
          'Received: *(.*)\n', message_body).group(1).strip()
        message['call_length'] = re.search(
          'Length: *(.*)\n', message_body).group(1).strip()
        message['phone_number'] = re.search(
          '.*Phone Number: *(.*)\n', message_body).group(1).strip()
        message['phone_company'] = re.search(
          '.*Phone Company: *(.*)\n', message_body).group(1).strip()
        message['phone_company_location'] = re.search(
          'Phone Company Location: *(.*)\n', message_body).group(1).strip()

        # Save the file
        # TODO(topher): make this add to database instead of disk
        abs_filename = os.path.join(save_directory, part.get_filename())
        with open(abs_filename, 'wb') as file:
            file.write(part.get_payload(decode=True))

        # Record that we now have sucessfully processed this ID
        config_file['last_id'] = email_id
        config_file.write()
        logging.info('Finished processing phonepeople email #{email}'.format(
            email=email_id))
finally:
    # Don't forget to release our lock file
    os.rmdir(lock_dir)
