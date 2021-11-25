from rest_framework import serializers
from rest_framework.validators import UniqueValidator
from .models import Folder, Topic, Set, SetDetail
from accounts.models import User


class SmallUserInformationSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username')

# Use this serializer to retrieve a list of set_details, create a new set_detail
# And retrieve/update/destroy set_detail by <id:int>


class SetDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = SetDetail
        fields = '__all__'

# Use this serializer to retrieve a list of sets, create a new set
# And retrieve/update/destroy set by <id:int>


class SetCreateWithManySetDetailSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)

    class Meta:
        model = SetDetail
        fields = '__all__'
        extra_kwargs = {'set': {'read_only': True},
                        'image': {'read_only': True}}


class SetListSerializer(serializers.ModelSerializer):
    user = SmallUserInformationSerializer(read_only=True)
    set_folders = serializers.SlugRelatedField(
        many=True, read_only=True, slug_field='id')
    set_details = SetCreateWithManySetDetailSerializer(
        write_only=True, many=True)
    amount = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = Set
        fields = ('id', 'is_public', 'name', 'description', 'image', 'date_created',
                  'date_updated', 'user', 'topic', 'set_folders', 'amount', 'set_details')

    def create(self, validated_data):
        set_details_data = validated_data.pop('set_details')
        set_model = Set.objects.create(**validated_data)
        for set_detail_data in set_details_data:
            set_detail_id = set_detail_data.pop('id', None)
            set_detail_model = SetDetail.objects.create(
                set=set_model, **set_detail_data)
            set_model.set_details.add(set_detail_model)
        return set_model

    def get_amount(self, obj):
        return obj.set_details.all().count()


class SetSerializer(serializers.ModelSerializer):
    user = SmallUserInformationSerializer(read_only=True)
    set_folders = serializers.SlugRelatedField(
        many=True, read_only=True, slug_field='id')
    set_details = SetCreateWithManySetDetailSerializer(
        required=False, many=True)

    class Meta:
        model = Set
        fields = ('id', 'is_public', 'name', 'description', 'image', 'date_created',
                  'date_updated', 'user', 'topic', 'set_folders', 'set_details')

    def update(self, instance, validated_data):
        set_details_data = validated_data.pop('set_details', None)
        set_model = instance
        if (self.context['request'].user == set_model.user) and (set_details_data != None):
            for set_detail_data in set_details_data:
                set_detail_id = set_detail_data.get('id', None)
                if set_detail_id:
                    set_detail_item = SetDetail.objects.get(
                        pk=set_detail_id, set=instance)
                    if set_detail_item:
                        set_detail_item.image = set_detail_data.get(
                            'image', set_detail_item.image)
                        set_detail_item.term = set_detail_data.get(
                            'term', set_detail_item.term)
                        set_detail_item.definition = set_detail_data.get(
                            'definition', set_detail_item.definition)
                        set_detail_item.term_lang = set_detail_data.get(
                            'term_lang', set_detail_item.term_lang)
                        set_detail_item.definition_lang = set_detail_data.get(
                            'definition_lang', set_detail_item.definition_lang)
                        set_detail_item.date_created = set_detail_data.get(
                            'date_created', set_detail_item.date_created)
                        set_detail_item.save()
                    else:
                        SetDetail.objects.create(
                            set=instance, **set_detail_data)
                else:
                    SetDetail.objects.create(set=instance, **set_detail_data)
        return super().update(instance, validated_data)

# Use this serializer to retrieve a list of folders, create a new folder
# And retrieve/update/destroy folder by <id:int>


class FolderListSerializer(serializers.ModelSerializer):
    name = serializers.CharField(required=True)
    user = SmallUserInformationSerializer(read_only=True)
    amount = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = Folder
        fields = ('id', 'is_public', 'name', 'description',
                  'date_created', 'date_updated', 'user', 'amount')

    def get_amount(self, obj):
        return obj.sets.all().count()


class FolderSerializer(serializers.ModelSerializer):
    name = serializers.CharField(required=True)
    user = SmallUserInformationSerializer(read_only=True)
    sets = SetListSerializer(read_only=True, many=True)

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


class TopicSetSerializer(serializers.ModelSerializer):
    amount = serializers.SerializerMethodField()

    class Meta:
        model = Set
        fields = ('id', 'name', 'user', 'amount')

    def get_amount(self, obj):
        return obj.set_details.all().count()


class TopicListSerializer(serializers.ModelSerializer):
    name = serializers.CharField(required=True, validators=[
                                 UniqueValidator(queryset=Topic.objects.all())])
    user = SmallUserInformationSerializer(read_only=True)
    amount = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = Topic
        fields = ('id', 'is_public', 'name', 'description',
                  'date_created', 'date_updated', 'user', 'amount')

    def get_amount(self, obj):
        return obj.topic_sets.all().count()


class TopicSerializer(serializers.ModelSerializer):
    name = serializers.CharField(required=True, validators=[
                                 UniqueValidator(queryset=Topic.objects.all())])
    user = SmallUserInformationSerializer(read_only=True)
    topic_sets = SetListSerializer(read_only=True, many=True)

    class Meta:
        model = Topic
        fields = ('id', 'is_public', 'name', 'description',
                  'date_created', 'date_updated', 'user', 'topic_sets')
