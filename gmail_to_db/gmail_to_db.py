import base64
import imaplib

detach_dir = '.' # directory where to save attachments (default: current)
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
    resp, data = gmail.fetch(email_id, "(RFC822)") 
    print data
    email_body = data[0][1] # getting the mail content
