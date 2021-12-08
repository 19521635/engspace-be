from rest_framework import serializers
from rest_framework.fields import ReadOnlyField, SerializerMethodField
from .models import *
from accounts.models import User

# USER


class SmallUserInformationSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username')
        ref_name = 'ForumSmallUserSerializer'

# FORUM POST


class PostListSerializer(serializers.ModelSerializer):
    user = SmallUserInformationSerializer(read_only=True)
    comments = SerializerMethodField(read_only=True)
    likes = SerializerMethodField(read_only=True)
    dislikes = SerializerMethodField(read_only=True)

    class Meta:
        model = Post
        fields = '__all__'
        extra_kwargs = {'body': {'write_only': True}}

    def get_likes(self, obj):
        return PostLike.objects.filter(post=obj, is_like=True).count()

    def get_dislikes(self, obj):
        return PostLike.objects.filter(post=obj, is_like=False).count()

    def get_comments(self, obj):
        return obj.post_comments.count()


class PostDetailSerializer(serializers.ModelSerializer):
    user = SmallUserInformationSerializer(read_only=True)
    comments = SerializerMethodField(read_only=True)
    likes = SerializerMethodField(read_only=True)
    dislikes = SerializerMethodField(read_only=True)

    class Meta:
        model = Post
        fields = '__all__'

    def get_likes(self, obj):
        return PostLike.objects.filter(post=obj, is_like=True).count()

    def get_dislikes(self, obj):
        return PostLike.objects.filter(post=obj, is_like=False).count()

    def get_comments(self, obj):
        return obj.post_comments.count()

# FORUM POST LIKE


class PostLikeListSerializer(serializers.ModelSerializer):
    user = SmallUserInformationSerializer(read_only=True)

    class Meta:
        model = PostLike
        fields = '__all__'

    def create(self, validated_data):
        instance, created = PostLike.objects.get_or_create(user=validated_data.get(
            'user'), post=validated_data.get('post'))
        if created:
            instance.save()
        else:
            instance.is_like = validated_data.get('is_like', True)
            instance.save()
        return instance


class PostLikeDetailSerializer(serializers.ModelSerializer):
    user = SmallUserInformationSerializer(read_only=True)
    post = ReadOnlyField(source='post.id')

    class Meta:
        model = PostLike
        fields = '__all__'

# FORUM POST FOLLOW


class PostFollowListSerializer(serializers.ModelSerializer):
    user = SmallUserInformationSerializer(read_only=True)

    class Meta:
        model = PostFollow
        fields = '__all__'

    def create(self, validated_data):
        instance, created = PostFollow.objects.get_or_create(user=validated_data.get(
            'user'), post=validated_data.get('post'))
        if created:
            instance.save()
        return instance


class PostFollowDetailSerializer(serializers.ModelSerializer):
    user = SmallUserInformationSerializer(read_only=True)

    class Meta:
        model = PostFollow
        fields = '__all__'

# FORUM COMMENT


class RecursiveSerializer(serializers.Serializer):
    def to_representation(self, value):
        serializer = self.parent.parent.__class__(value, context=self.context)
        return serializer.data


class CommentListSerializer(serializers.ModelSerializer):
    user = SmallUserInformationSerializer(read_only=True)
    likes = SerializerMethodField(read_only=True)
    dislikes = SerializerMethodField(read_only=True)

    class Meta:
        model = Comment
        fields = '__all__'

    def get_likes(self, obj):
        return CommentLike.objects.filter(comment=obj, is_like=True).count()

    def get_dislikes(self, obj):
        return CommentLike.objects.filter(comment=obj, is_like=False).count()


class CommentListByPostSerializer(serializers.ModelSerializer):
    user = SmallUserInformationSerializer(read_only=True)
    childrens = RecursiveSerializer(many=True, read_only=True)
    likes = SerializerMethodField(read_only=True)
    dislikes = SerializerMethodField(read_only=True)

    class Meta:
        model = Comment
        fields = '__all__'

    def get_likes(self, obj):
        return CommentLike.objects.filter(comment=obj, is_like=True).count()

    def get_dislikes(self, obj):
        return CommentLike.objects.filter(comment=obj, is_like=False).count()


class CommentDetailSerializer(serializers.ModelSerializer):
    user = SmallUserInformationSerializer(read_only=True)
    likes = SerializerMethodField(read_only=True)
    dislikes = SerializerMethodField(read_only=True)

    class Meta:
        model = Comment
        fields = '__all__'

    def get_likes(self, obj):
        return CommentLike.objects.filter(comment=obj, is_like=True).count()

    def get_dislikes(self, obj):
        return CommentLike.objects.filter(comment=obj, is_like=False).count()

# FORUM COMMENT LIKE


class CommentLikeListSerializer(serializers.ModelSerializer):
    user = SmallUserInformationSerializer(read_only=True)

    class Meta:
        model = CommentLike
        fields = '__all__'

    def create(self, validated_data):
        instance, created = CommentLike.objects.get_or_create(user=validated_data.get(
            'user'), comment=validated_data.get('comment'))
        if created:
            instance.save()
        else:
            instance.is_like = validated_data.get('is_like', True)
            instance.save()
        return instance


class CommentLikeDetailSerializer(serializers.ModelSerializer):
    user = SmallUserInformationSerializer(read_only=True)
    comment = ReadOnlyField(source='comment.id')

    class Meta:
        model = CommentLike
        fields = '__all__'
