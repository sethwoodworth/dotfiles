# Create your views here.
from django.shortcuts import render_to_response
from django.views import RequestContext

def triage_voicemail(request):
    render_to_response('triage/triage_detail.html',
                       {},
                       context_instance=RequestContext(request),
                      ) 
