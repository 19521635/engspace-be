from django.db.models import fields
from rest_framework import serializers
from .models import Folder, Topic


class FolderSerializer(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source="user.id")

    class Meta:
        model = Folder
        fields = ('id', 'is_public', 'name', 'description',
                  'date_created', 'date_updated', 'user')


class TopicSerializer(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source="user.id")

    class Meta:
        model = Topic
        fields = fields = ('id', 'is_public', 'name', 'description',
                           'date_created', 'date_updated', 'user')
