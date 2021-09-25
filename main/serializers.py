from rest_framework import serializers
from rest_framework.validators import UniqueValidator
from .models import Folder, Topic, Set, SetDetail


class FolderSerializer(serializers.ModelSerializer):
    name = serializers.CharField(required=True, validators=[
                                 UniqueValidator(queryset=Folder.objects.all())])
    user = serializers.ReadOnlyField(source='user.id')

    class Meta:
        model = Folder
        fields = ('id', 'is_public', 'name', 'description',
                  'date_created', 'date_updated', 'user', 'sets')


class FolderSetSerializer(serializers.Serializer):
    folder_id = serializers.IntegerField(required=True)
    set_id = serializers.IntegerField(required=True)


class TopicSerializer(serializers.ModelSerializer):
    name = serializers.CharField(required=True, validators=[
                                 UniqueValidator(queryset=Topic.objects.all())])
    user = serializers.ReadOnlyField(source='user.id')
    topic_set = serializers.SlugRelatedField(
        many=True, read_only=True, slug_field='id')

    class Meta:
        model = Topic
        fields = ('id', 'is_public', 'name', 'description',
                  'date_created', 'date_updated', 'user', 'topic_set')


class SetDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = SetDetail
        fields = '__all__'


class SetSerializer(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source='user.id')
    set_folder = serializers.SlugRelatedField(
        many=True, read_only=True, slug_field='id')
    set_detail = SetDetailSerializer(read_only=True, many=True)

    class Meta:
        model = Set
        fields = ('id', 'is_public', 'name', 'description', 'date_created',
                  'date_updated', 'user', 'topic', 'set_folder', 'set_detail')