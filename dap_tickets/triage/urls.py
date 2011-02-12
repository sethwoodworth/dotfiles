from django.conf.urls.defaults import *
from django.views.generic.simple import direct_to_template
import os
import settings
from triage.models import Voicemail



urlpatterns = patterns('',

    
    ('^$', 'triage.views.triage_voicemail', {}, 'triage-detail')
    ('^create$', 'triage.views.triage_submission', {}, 'triage-create')

    
)

