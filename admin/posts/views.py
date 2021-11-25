from rest_framework import generics, permissions
from django.shortcuts import get_object_or_404
from .serializers import *
from forum.models import *
from drf_yasg.utils import swagger_auto_schema

# Create your views here.
# FORUM POST
# HAVE LIST POST BY USER
# INCREASE VIEW COUNT IN POST DETAIL RETRIEVE


class PostListAPIView(generics.ListCreateAPIView):
    queryset = Post.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = AdminPostListSerializer

    @swagger_auto_schema(operation_summary="Retrieve a list of all posts")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Save a new post")
    def post(self, request, *args, **kwargs):
        return super().post(request, *args, **kwargs)


class PostDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Post.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = AdminPostDetailSerializer

    @swagger_auto_schema(operation_summary="Retrieve a post detail for this post id then increase view count by one")
    def get(self, request, *args, **kwargs):
        obj = self.get_object()
        obj.view_count = obj.view_count + 1
        obj.save(update_fields=['view_count'])
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update an existing post detail for this post id")
    def put(self, request, *args, **kwargs):
        return super().put(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update partial an existing post detail for this post id")
    def patch(self, request, *args, **kwargs):
        return super().patch(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Delete the specified post by post id")
    def delete(self, request, *args, **kwargs):
        return super().destroy(request, *args, **kwargs)


class PostListByUserAPIView(generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = AdminPostListSerializer

    def get_queryset(self):
        if getattr(self, 'swagger_fake_view', False):
            return Post.objects.none()
        user_id = self.kwargs['pk']
        return Post.objects.filter(user=user_id)

    @swagger_auto_schema(operation_summary="Retrieve a list of all posts by user id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)
