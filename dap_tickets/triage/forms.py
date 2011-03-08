from django import forms

from models import Voicemail

class VoicemailForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(VoicemailForm, self).__init__(*args, **kwargs)
        if 'instance' in kwargs.keys():
            vmail = kwargs['instance']
            self.fields['transcription'].initial = vmail.transcription

    
    class Meta:
        model = Voicemail
        exclude = ('user', 'audio_file', 'phone_number', 'date')

        