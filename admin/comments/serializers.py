from rest_framework import serializers
from rest_framework.fields import SerializerMethodField
from forum.models import *
# FORUM COMMENT


class AdminRecursiveSerializer(serializers.Serializer):
    def to_representation(self, value):
        serializer = self.parent.parent.__class__(value, context=self.context)
        return serializer.data


class AdminCommentListSerializer(serializers.ModelSerializer):
    likes = SerializerMethodField(read_only=True)
    dislikes = SerializerMethodField(read_only=True)

    class Meta:
        model = Comment
        fields = '__all__'

    def get_likes(self, obj):
        return CommentLike.objects.filter(comment=obj, is_like=True).count()

    def get_dislikes(self, obj):
        return CommentLike.objects.filter(comment=obj, is_like=False).count()


class AdminCommentListByPostSerializer(serializers.ModelSerializer):
    childrens = AdminRecursiveSerializer(many=True, read_only=True)
    likes = SerializerMethodField(read_only=True)
    dislikes = SerializerMethodField(read_only=True)

    class Meta:
        model = Comment
        fields = '__all__'

    def get_likes(self, obj):
        return CommentLike.objects.filter(comment=obj, is_like=True).count()

    def get_dislikes(self, obj):
        return CommentLike.objects.filter(comment=obj, is_like=False).count()


class AdminCommentDetailSerializer(serializers.ModelSerializer):
    likes = SerializerMethodField(read_only=True)
    dislikes = SerializerMethodField(read_only=True)

    class Meta:
        model = Comment
        fields = '__all__'

    def get_likes(self, obj):
        return CommentLike.objects.filter(comment=obj, is_like=True).count()

    def get_dislikes(self, obj):
        return CommentLike.objects.filter(comment=obj, is_like=False).count()
