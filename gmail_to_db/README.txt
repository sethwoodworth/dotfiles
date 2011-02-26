gmail_to_db.py
Script for retrieving gmail messages, then loading them into the web app.

= Setup = 
config file 'gmail_to_db.cfg' must be in the directory with this script 
containing the following elements:
  - last_id_processed = int for the id of the last successful email that was
      downloaded and saved. Set to 0 to initialize and populate the db.
  - gmail_username
  - gmail_encrypted_password = password, encrypted with base64.b64encode(1)
  - upload_url = the POST url for the database

= Usage =
  Just run the script with python:
    python gmail_to_db.py
  On the server, this should be run as a cron job every 1-5 minutes. 

= Algorithm =
  - Creates a lck directory to ensure only one of this script runs at a time
  - Retrieves the ID of every email on the gmail server
  - For each ID after the last successful email processed:
    - Retrieves all the data (message headers, body, and attachments)
      associated with the message
    - Makes sure the email is from PhonePeople and contains a .wav attachment
      - Skips to the next one if not
    - Parses the relevent information from message body
    - Saves the .wav attachment to disk
    - Sends the information on the message to the web server
    - Updates the last_id in the config file
  - Releases the lck directory
