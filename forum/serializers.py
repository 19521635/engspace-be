from django.db.models import fields
from rest_framework import serializers
from .models import *
from accounts.models import User

# USER


class SmallUserInformationSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username')

# FORUM POST


class PostListSerializer(serializers.ModelSerializer):
    user = SmallUserInformationSerializer(read_only=True)

    class Meta:
        model = Post
        fields = '__all__'


class PostDetailSerializer(serializers.ModelSerializer):
    user = SmallUserInformationSerializer(read_only=True)

    class Meta:
        model = Post
        fields = '__all__'
