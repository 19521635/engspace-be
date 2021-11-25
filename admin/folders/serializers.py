from django.db.models import fields
from rest_framework import serializers
from main.models import Folder, Set


class FolderListAdminSerializer(serializers.ModelSerializer):
    class Meta:
        model = Folder
        exclude = ['sets']


class FolderSetSerializer(serializers.ModelSerializer):
    class Meta:
        model = Set
        fields = ('id', 'name')


class FolderDetailAdminSerializer(serializers.ModelSerializer):
    sets = FolderSetSerializer(read_only=True, many=True)

    class Meta:
        model = Folder
        fields = '__all__'
