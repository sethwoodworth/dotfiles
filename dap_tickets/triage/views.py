# Create your views here.
from django.contrib.auth.decorators import login_required
from django.shortcuts import render_to_response
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext

from forms import VoicemailForm
from models import Voicemail
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.models import User

from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def triage_create(request):
    if request.method == 'POST' and request.POST['audio_file']:
        vmail = Voicemail(audio_file = request.POST['audio_file'], phone_number = request.POST['phone_number'] )
        vmail.save()
         
    return HttpResponseRedirect('/')





@login_required
# Need to make this pull a form for a yet to be done call
def triage_voicemail(request):
    os = Voicemail.objects.filter(reviewed=False)
    if len(os):
        o = os[0]
        form = VoicemailForm(instance=o)
        voicemail = o
        
        dict = {
        'form': form,
        'voicemail':voicemail,
        }
    
    else:
        dict = {}

    
    return render_to_response('triage/triage_detail.html', dict,
                              context_instance=RequestContext(request))
    
    

def triage_submission(request, vmail_id):
    if request.method == 'POST':
        vmail = get_object_or_404(Voicemail, pk=vmail_id)
        
        form = VoicemailForm(request.POST, request.FILES, instance=vmail)
        if form.is_valid():
            o = form.save(commit=False)
            o.user = request.user
            o.reviewed = True
            o.save()
            # o.last_saved = 

    return HttpResponseRedirect('/')


    # return render_to_response('triage/triage_detail.html', dict,
    #                          context_instance=RequestContext(request))
