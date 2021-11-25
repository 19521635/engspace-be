from rest_framework import generics, permissions
from django.shortcuts import get_object_or_404
from .serializers import *
from forum.models import *
from drf_yasg.utils import swagger_auto_schema

# FORUM COMMENT
# HAVE LIST COMMENT BY USER


class CommentListAPIView(generics.ListCreateAPIView):
    queryset = Comment.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = AdminCommentListSerializer

    @swagger_auto_schema(operation_summary="Retrieve a list of all comments")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Save a new comment")
    def post(self, request, *args, **kwargs):
        return super().post(request, *args, **kwargs)


class CommentDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Comment.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = AdminCommentDetailSerializer

    @swagger_auto_schema(operation_summary="Retrieve a comment detail for this comment id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update an existing comment detail for this comment id")
    def put(self, request, pk, *args, **kwargs):
        return super().put(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update partial an existing comment detail for this comment id")
    def patch(self, request, pk, *args, **kwargs):
        return super().patch(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Delete the specified comment by comment id")
    def delete(self, request, pk, *args, **kwargs):
        return super().destroy(request, *args, **kwargs)


class CommentListByUserAPIView(generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = AdminCommentListSerializer

    def get_queryset(self):
        if getattr(self, 'swagger_fake_view', False):
            return Comment.objects.none()
        user_id = self.kwargs['pk']
        return Comment.objects.filter(user=user_id)

    @swagger_auto_schema(operation_summary="Retrieve a list of all comments by user id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)


class CommentListByPostAPIView(generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = AdminCommentListByPostSerializer

    def get_queryset(self):
        if getattr(self, 'swagger_fake_view', False):
            return Comment.objects.none()
        post_id = self.kwargs['pk']
        return Comment.objects.filter(post=post_id, parent__isnull=True)

    @swagger_auto_schema(operation_summary="Retrieve a list of all comments by post id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)
