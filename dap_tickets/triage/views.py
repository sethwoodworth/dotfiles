# Create your views here.
from django.contrib.auth.decorators import login_required
from django.shortcuts import render_to_response
from django.template import RequestContext

from forms import VoicemailForm
from django.http import HttpResponse, HttpResponseRedirect

@login_required
# Need to make this pull a form for a yet to be done call
def triage_voicemail(request):
    dict = {
    'form': VoicemailForm()
    }

    
    return render_to_response('triage/triage_detail.html', dict,
                              context_instance=RequestContext(request))
    
    

def triage_submission(request):
    if request.method == 'POST':
        form = VoicemailForm(request.POST)
  
        if form.is_valid():
            o = form.save(commit=False)
            o.user = request.user
            o.save()
            # o.last_saved = 

    return HttpResponseRedirect('/')


    # return render_to_response('triage/triage_detail.html', dict,
    #                          context_instance=RequestContext(request))
