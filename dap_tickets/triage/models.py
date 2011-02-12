from django.db import models
from django.models import User

# Create your models here.

class Voicemail(models.Model):
    EVENT_CHOICES = (
        ('H', 'Hurricane'),
        ('E', 'Earthquake'),
    )

    URGENCY_CHOICES = (
        ('C', 'Chilling'),
        ('S', 'Spam'),
    )

    user            = OneToOneField(User)

    audio_file      = URLField()
    phone_number    = CharField()
    date            = DateTimeField(auto_now=True)
    transcription   = TextField()
    call_summary    = CharField( max_length = 255)
    location        = CharField( max_length = 255)
    event           = CharField( choices=EVENT_CHOICES )
    urgency         = CharField( choices=URGENCY_CHOICES )
    tags            = CharField( max_length = 255 )
    need            = TextField()
    last_saved      = DateTimeField(auto_now = True)

