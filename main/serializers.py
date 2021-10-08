from rest_framework import serializers
from rest_framework.validators import UniqueValidator
from .models import Folder, Topic, Set, SetDetail

# Use this serializer to retrieve a list of folders, create a new folder
# And retrieve/update/destroy folder by <id:int>


class FolderSerializer(serializers.ModelSerializer):
    name = serializers.CharField(required=True)
    user = serializers.ReadOnlyField(source='user.id')

    class Meta:
        model = Folder
        fields = ('id', 'is_public', 'name', 'description',
                  'date_created', 'date_updated', 'user', 'sets')

# Use this serializer to add/remove set from folder


class FolderSetSerializer(serializers.Serializer):
    folder_id = serializers.IntegerField(required=True)
    set_id = serializers.IntegerField(required=True)

# Use this serializer to retrieve a list of topics, create a new topic
# And retrieve/update/destroy topic by <id:int>


class TopicSerializer(serializers.ModelSerializer):
    name = serializers.CharField(required=True, validators=[
                                 UniqueValidator(queryset=Topic.objects.all())])
    user = serializers.ReadOnlyField(source='user.id')
    topic_sets = serializers.SlugRelatedField(
        many=True, read_only=True, slug_field='id')

    class Meta:
        model = Topic
        fields = ('id', 'is_public', 'name', 'description',
                  'date_created', 'date_updated', 'user', 'topic_sets')

# Use this serializer to retrieve a list of set_details, create a new set_detail
# And retrieve/update/destroy set_detail by <id:int>


class SetDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = SetDetail
        fields = '__all__'

# Use this serializer to retrieve a list of sets, create a new set
# And retrieve/update/destroy set by <id:int>


class SetSerializer(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source='user.id')
    set_folders = serializers.SlugRelatedField(
        many=True, read_only=True, slug_field='id')
    set_details = SetDetailSerializer(read_only=True, many=True)

    class Meta:
        model = Set
        fields = ('id', 'is_public', 'name', 'description', 'date_created',
                  'date_updated', 'user', 'topic', 'set_folders', 'set_details')
