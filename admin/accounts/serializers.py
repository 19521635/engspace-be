from django.db.models import fields
from rest_framework import serializers
from accounts.models import *


class UserListAdminSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'first_name',
                  'last_name', 'date_joined')


class UserDetailAdminSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = "__all__"
        extra_kwargs = {'is_superuser': {'read_only': True}, 'password': {
            'required': False}, 'username': {'required': False}}


class UserProfileListAdminSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = '__all__'


class UserProfileDetailAdminSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = '__all__'
        extra_kwargs = {'user': {'read_only': True}}
