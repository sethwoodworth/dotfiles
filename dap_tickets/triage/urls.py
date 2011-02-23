from django.conf.urls.defaults import *
from django.views.generic.simple import direct_to_template
import os
import settings
from triage.models import Voicemail



urlpatterns = patterns('',

    
    ('^update/(?P<vmail_id>\d+)/$', 'triage.views.triage_submission', {}, 'triage-update'),
    ('^create/$', 'triage.views.triage_create', {}, 'triage-create')

    
)

