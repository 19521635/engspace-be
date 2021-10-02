from django.db.models import fields
from rest_framework import serializers
from main.models import Folder


class FolderAdminSerializer(serializers.ModelSerializer):
    class Meta:
        model = Folder
        exclude = ['sets']
