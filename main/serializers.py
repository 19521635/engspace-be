from django.db.models import fields
from rest_framework import serializers
from .models import Folder, Topic


class FolderSerializer(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source="user.id")

    class Meta:
        model = Folder
        fields = ('id', 'name', 'description', 'created_at', 'user')


class TopicSerializer(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source="user.id")

    class Meta:
        model = Topic
        fields = ('id', 'name', 'description', 'created_at', 'user')
