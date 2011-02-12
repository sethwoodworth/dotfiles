from django.db import models
from django.contrib.auth.models import User

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

    user            = models.OneToOneField(User)

    audio_file      = models.URLField()
    phone_number    = models.CharField( max_length= 15 )
    date            = models.DateTimeField(auto_now=True)
    transcription   = models.TextField()
    call_summary    = models.CharField( max_length = 255)
    location        = models.CharField( max_length = 255)
    event           = models.CharField( max_length = 10, choices=EVENT_CHOICES )
    urgency         = models.CharField( max_length = 10, choices=URGENCY_CHOICES )
    tags            = models.CharField( max_length = 255 )
    need            = models.TextField()
    last_saved      = models.DateTimeField(auto_now = True)

    def __str__(self):
        return self.phone_number + " on " + self.date.isoformat()
