# Create your views here.
from django.shortcuts import render_to_response
from django.template import RequestContext

from forms import VoicemailForm

def triage_voicemail(request):
    render_to_response('triage/triage_detail.html',
                       {},
                       context_instance=RequestContext(request),
                      ) 

def triage_submission(request):
    if request.method == 'POST':
        form = VoicemailForm(request.POST)
  
        if form.is_valid():
            o = form.save(commit=True) 
            # o.last_saved = 
            return HttpResponseRedirect('/thanks/')

    else:
        dict = {
            'form': VoicemailForm(),
            }


    return render_to_response('triage/triage_detail.html', dict,
                              context_instance=RequestContext(request))
                             