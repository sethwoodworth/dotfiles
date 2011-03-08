from django.conf.urls.defaults import *
from django.views.generic.simple import direct_to_template
import os
import settings

from registration.forms import RegistrationFormUniqueEmail

from tastypie.api import Api
from triage.api.resources import VoicemailResource

v1_api = Api(api_name='v1')
v1_api.register(VoicemailResource())

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

voicemail_resource = VoicemailResource()

urlpatterns = patterns('',
    # Example:
    # (r'^dap_tickets/', include('dap_tickets.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # (r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    (r'^admin/', include(admin.site.urls)),
    
    ('^$', 'triage.views.triage_voicemail', {}, 'triage-detail'),

    
    ('^triage/', include('triage.urls')),


    (r'accounts/', include('registration.urls')), 

    (r'api/', include(v1_api.urls)),

)



if settings.DEBUG:
    urlpatterns += patterns('',
                            
        # Apache config will serve these from the static server.
        # These are used only in dev runsrever mode 
        (r'^files/(?P<path>.*)$', 'django.views.static.serve',
              {'document_root':os.path.dirname(__file__) + "/files"}),
    
        # care of them. use only in dev runsrever mode 
        (r'^static/(?P<path>.*)$', 'django.views.static.serve',
              {'document_root':os.path.dirname(__file__) + "/static"}),  
              
  )
