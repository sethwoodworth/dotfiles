import os
import os.path
import datetime
import uuid

from django.template.defaultfilters import slugify

def create_slug(cls, name):
    """
    Create unique slug field from name for object cls
    """
    s = slugify(name)[:60]
    slug = s
    i = 0
    while (cls.objects.filter(slug=slug).count() <> 0) and \
            (i < 100):
        i += 1
        slug = '%s-%d' % (s,i)
    if i == 100:
       raise MultipleObjectsReturned()

    return slug

def get_image_path(instance, filename):
    # generate unique filename
    u = uuid.uuid4()
    p = 'photologue/%s/%s/%s/%s%s' % (u.hex[0:2], u.hex[2:4], u.hex[4:6], u.hex[6:33], os.
path.splitext(filename)[1])
    return p

def queue_message(request, msg):
    """
    Queue a simple message for this user for display on
    next screen.
    """
    request.user.message_set.create(message=msg)

def make_content_file(path):
    """ Simulate file upload.
        Returns (name, contentFile)

        usage:

        (fn, data) = make_content_file(image_path)
        if not data:
            return

        try:
            if member.memberimage:
                member.memberimage.delete()
        except MemberImage.DoesNotExist:
            pass

        im = MemberImage(member=member)
        im.image.save(fn, data)
        im.save()
        member.image = im

    """
    from django.core.files.base import ContentFile

    data = None
    name = os.path.basename(path)

    try:
        f = open(path, 'r')
        data = f.read()
        f.close()
    except:
        return (name, None)

    return (name, ContentFile(data))



