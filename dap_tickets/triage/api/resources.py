from tastypie.resources import ModelResource
from tastypie.authentication import Authentication
from tastypie.authorization import Authorization
from triage.models import Voicemail

class VoicemailResource(ModelResource):
    class Meta: 
        queryset = Voicemail.objects.all()
        resource_name = 'voicemail'
        authentication = Authentication()
        authorization = Authorization()
