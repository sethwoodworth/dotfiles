from __future__ import with_statement
import base64
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
user = 'daphotline'
password = base64.b64decode('ZmViMTEyMDEx')

# connecting to the gmail imap server
gmail = imaplib.IMAP4_SSL("imap.gmail.com")
gmail.login(user, password)
# here you a can choose a mail box like INBOX instead
gmail.select("[Gmail]/All Mail") 

# Download the email ids
ok_response, item_string = gmail.search(None, "ALL")
if (ok_response != 'OK'):
    logging.error('gmail.search returned error: {err}'. format(err=ok_response))
    sys.exit()
email_ids = map(int, item_string[0].split())

# Check each email that we an id for to see if it's a message we want
for email_id in email_ids[-1:]:
    logging.debug("processing email_id: {id}".format(id=email_id))
    # fetching the mail, "`(RFC822)`" means "get the whole stuff"
    ok_response, data = gmail.fetch(email_id, "(RFC822)") 
    if (ok_response != 'OK'):
        logging.error('gmail.fetch returned error: {err}'.
                     format(err=ok_response))
        sys.exit()

    # getting the mail content
    email_body = data[0][1]
    mail = email.message_from_string(email_body)

    # Make sure we're looking at an email from phonepeople.com
    if (not re.search('phonepeople.com', mail["From"])):
        logging.debug("The email isn't from phonepeople.com- skipping")
        sys.exit()

    # Check each part of the email to find (and save) the .wav file
    for part in mail.walk():
        if re.match('audio/wav', part.get('Content-Type')):
            logging.info("We've found a .wav from phonepeople!")
            abs_filename = os.path.join(save_directory, part.get_filename())

            # Make sure it isn't already a file
            if os.path.isfile(abs_filename):
                logging.error("The file {filename} already exists".
                              format(filename=abs_filename))
                continue

            # Save the file
            # TODO(topher): make this add to database instead of disk
            with open(abs_filename, 'wb') as file:
                file.write(part.get_payload(decode=True))
