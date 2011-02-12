from __future__ import with_statement
import base64
import email.parser
import imaplib
import os
import re

save_directory = os.getcwd() # directory where to save attachments (default: current)
user = 'daphotline'
password = base64.b64decode('ZmViMTEyMDEx')

# connecting to the gmail imap server
gmail = imaplib.IMAP4_SSL("imap.gmail.com")
gmail.login(user, password)
# here you a can choose a mail box like INBOX instead
gmail.select("[Gmail]/All Mail") 

# Download the email ids
ok_response, item_string = gmail.search(None, "ALL")
assert(ok_response == 'OK')  # TODO(topher): do something on error response
email_ids = map(int, item_string[0].split())

print email_ids
print email_ids[-1]
for email_id in email_ids[-1:]:
    print email_id

    # fetching the mail, "`(RFC822)`" means "get the whole stuff", but you can
    # ask for headers only, etc
    ok_response, data = gmail.fetch(email_id, "(RFC822)") 
    assert(ok_response == 'OK')  # TODO(topher): do something on error response

    email_body = data[0][1] # getting the mail content
    mail = email.message_from_string(email_body)
    for part in  mail.walk():
        print part.get('Content-Type')
        if re.match('audio/wav', part.get('Content-Type')):
            print "found it!!!"
            abs_filename = os.path.join(save_directory, part.get_filename())
            with open(abs_filename, 'wb') as file:
                file.write(part.get_payload(decode=True))
