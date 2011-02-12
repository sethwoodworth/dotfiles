from django import forms

from models import Voicemail

class VoicemailForm(forms.ModelForm)
    class Meta:
        model = Voicemail
        exclude = [user, audio_file, phone_number, date]

