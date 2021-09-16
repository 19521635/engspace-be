from django.db import models
from django.contrib.auth.models import AbstractUser
from django.conf import settings
# Create your models here.


class User(AbstractUser):
    pass


class UserProfile(models.Model):
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='profile')
    dob = models.DateField()
    website = models.URLField(blank=True, default="")
    bio = models.TextField(blank=True, max_length=100, default="")
    fb_url = models.URLField(blank=True, default="",
                             verbose_name="facebook url")
    avatar = models.ImageField(default="default.jpg", upload_to="profile_imgs")

    def __str__(self):
        return f'{self.user.first_name} {self.user.last_name}'
