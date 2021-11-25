from rest_framework import serializers
from rest_framework.fields import SerializerMethodField
from forum.models import *
from accounts.models import User

# USER


class AdminSmallUserInformationSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username')
        ref_name = 'ForumSmallUserSerializer'

# FORUM POST


class AdminPostListSerializer(serializers.ModelSerializer):
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


class AdminPostDetailSerializer(serializers.ModelSerializer):
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
