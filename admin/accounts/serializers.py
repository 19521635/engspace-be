from django.db.models import fields
from rest_framework import serializers
from accounts.models import *


class UserListAdminSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'first_name',
                  'last_name', 'date_joined')


class UserDetailAdminSerializer(serializers.ModelSerializer):
    dob = serializers.DateField(
        source='profile.dob', required=False)
    website = serializers.URLField(
        source='profile.website', allow_blank=True, allow_null=True, required=False)
    bio = serializers.CharField(
        source='profile.bio', allow_blank=True, allow_null=True, required=False)
    fb_url = serializers.URLField(
        source='profile.fb_url', allow_blank=True, allow_null=True, required=False)
    avatar = serializers.ImageField(source='profile.avatar', required=False)

    class Meta:
        model = User
        fields = "__all__"
        extra_kwargs = {'is_superuser': {'read_only': True}}
