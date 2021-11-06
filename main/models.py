from django.db import models
from django.conf import settings
from django.db.models.deletion import CASCADE

# Create your models here.


class Topic(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True, max_length=255, default="")
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                             on_delete=CASCADE, related_name='topics', related_query_name='topic')
    is_public = models.BooleanField(default=True, verbose_name="public")
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['id']


def set_image_upload_to(instance, filename):
    return 'set_imgs/%s/%s' % (instance.user.id, filename)


class Set(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True, max_length=255, default="")
    image = models.ImageField(blank=True, upload_to=set_image_upload_to)
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                             on_delete=CASCADE, related_name='sets', related_query_name='set')
    topic = models.ForeignKey(Topic, on_delete=CASCADE,
                              related_name='topic_sets', related_query_name='topic_set')
    is_public = models.BooleanField(default=True, verbose_name="public")
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['id']


def term_image_upload_to(instance, filename):
    return 'term_imgs/%s/%s' % (instance.user.id, filename)


class SetDetail(models.Model):
    class TextLang(models.TextChoices):
        english = "en", "English"
        vietnamese = "vi", "Vietnamese"
    set = models.ForeignKey(
        Set, on_delete=CASCADE, related_name='set_details', related_query_name='set_detail')
    image = models.ImageField(blank=True, upload_to=term_image_upload_to)
    term = models.TextField(blank=False)
    definition = models.TextField(blank=False)
    term_lang = models.CharField(
        max_length=10, choices=TextLang.choices, default=TextLang.english)
    definition_lang = models.CharField(
        max_length=10, choices=TextLang.choices, default=TextLang.vietnamese)
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)


class Folder(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True, max_length=255, default="")
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                             on_delete=CASCADE, related_name='folders', related_query_name='folder')
    is_public = models.BooleanField(default=True, verbose_name="public")
    sets = models.ManyToManyField(
        Set, blank=True, related_name='set_folders', related_query_name='set_folder')
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['id']

    @classmethod
    def add(cls, folder, set):
        folder.sets.add(set)

    @classmethod
    def remove(cls, folder, set):
        folder.sets.remove(set)
