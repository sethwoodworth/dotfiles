# Create your views here.
from django.contrib.auth.decorators import login_required
from django.shortcuts import render_to_response
from django.views import RequestContext

from forms import VoicemailForm

@login_required
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
            form = VoicemailForm()

    return render_to_response('triage/triage_detail.html', 
                              'form':form,
                             )
