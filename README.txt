# Disaster Accountability Project- Ticket Classification Website

This website will be used to transcribe, tag, and classify disaster hotline
voicemails.

## Parts of the site
gmail_to_db.py: Retrieves emails from the gmail server. Parses the relevant
information from the emails and pushes it, along with the voicemails, to the
Django web app via POST.

Django web app: Frontend for volunteers to classify the voicemails. The main
page presents a voicemail to the user from the database, and saves the
entered information back to the database.

Admin backend: This is how the administrators at DAP (ie: Ben) access the data
the volunteers have generated. Currently uses the default Django presentation
of the database.

