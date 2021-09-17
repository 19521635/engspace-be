from django.db import models
from django.contrib.auth.models import AbstractUser
from django.conf import settings
from django.db.models.signals import post_save
from django.dispatch import receiver
# Create your models here.


class User(AbstractUser):
    pass


class UserProfile(models.Model):
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='profile')
    dob = models.DateField(blank=True, null=True)
    website = models.URLField(blank=True, default="")
    bio = models.TextField(blank=True, max_length=100, default="")
    fb_url = models.URLField(blank=True, default="",
                             verbose_name="facebook url")
    avatar = models.ImageField(default="default.jpg", upload_to="profile_imgs")

    def __str__(self):
        return f'{self.user.last_name} {self.user.first_name}'

    @property
    def full_name(self):
        return f'{self.user.last_name} {self.user.first_name}'

    @property
    def username(self):
        return self.user.username


@receiver(post_save, sender=User)
def create_profile(sender, instance, created, *args, **kwargs):
    if created:
        user_profile = UserProfile(user=instance)
        user_profile.save()
