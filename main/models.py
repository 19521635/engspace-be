from django.db import models
from django.conf import settings
from django.db.models.deletion import CASCADE

# Create your models here.


class Folder(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True, max_length=255, default="")
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                             on_delete=CASCADE, related_name="folder")
    is_public = models.BooleanField(default=True, verbose_name="public")
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name


class Topic(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True, max_length=255, default="")
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                             on_delete=CASCADE, related_name="topic")
    is_public = models.BooleanField(default=True, verbose_name="public")
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name
