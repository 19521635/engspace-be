from rest_framework import generics, permissions, filters
from django.shortcuts import get_object_or_404
from .serializers import *
from .models import *
from drf_yasg.utils import swagger_auto_schema
# Create your views here.

# FORUM POST
# HAVE LIST POST BY USER
# INCREASE VIEW COUNT IN POST DETAIL RETRIEVE


class PostListAPIView(generics.ListCreateAPIView):
    queryset = Post.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = PostListSerializer
    filter_backends = (filters.SearchFilter,)
    search_fields = ('name', 'body',)

    @swagger_auto_schema(operation_summary="Retrieve a list of all posts")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Save a new post")
    def post(self, request, *args, **kwargs):
        return super().post(request, *args, **kwargs)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class PostDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Post.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = PostDetailSerializer

    @swagger_auto_schema(operation_summary="Retrieve a post detail for this post id then increase view count by one")
    def get(self, request, *args, **kwargs):
        obj = self.get_object()
        obj.view_count = obj.view_count + 1
        obj.save(update_fields=['view_count'])
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update an existing post detail for this post id")
    def put(self, request, pk, *args, **kwargs):
        get_object_or_404(request.user.posts, pk=pk)
        return super().put(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update partial an existing post detail for this post id")
    def patch(self, request, pk, *args, **kwargs):
        get_object_or_404(request.user.posts, pk=pk)
        return super().patch(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Delete the specified post by post id")
    def delete(self, request, pk, *args, **kwargs):
        get_object_or_404(request.user.posts, pk=pk)
        return super().destroy(request, *args, **kwargs)


class PostListByUserAPIView(generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = PostListSerializer

    def get_queryset(self):
        if getattr(self, 'swagger_fake_view', False):
            return Post.objects.none()
        user_id = self.kwargs['pk']
        return Post.objects.filter(user=user_id)

    @swagger_auto_schema(operation_summary="Retrieve a list of all posts by user id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

# FORUM POST LIKE
# LIST TO CREATE NEW LIKE
# DETAIL TO UPDATE LIKE TO DISLIKE OR REVERSE
# DETAIL ALSO DELETE LIKE
# HAVE LIST POST LIKE FROM USER ID OR POST ID


class PostLikeListAPIView(generics.ListCreateAPIView):
    queryset = PostLike.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = PostLikeListSerializer

    @swagger_auto_schema(operation_summary="Retrieve a list of all post likes")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Save a new post like")
    def post(self, request, *args, **kwargs):
        return super().post(request, *args, **kwargs)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class PostLikeDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = PostLike.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = PostLikeDetailSerializer

    @swagger_auto_schema(operation_summary="Retrieve a post like detail for this post like id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update an existing post like detail for this post like id")
    def put(self, request, pk, *args, **kwargs):
        get_object_or_404(request.user.user_post_likes, pk=pk)
        return super().put(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update partial an existing post like detail for this post like id")
    def patch(self, request, pk, *args, **kwargs):
        get_object_or_404(request.user.user_post_likes, pk=pk)
        return super().patch(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Delete the specified post like by post like id")
    def delete(self, request, pk, *args, **kwargs):
        get_object_or_404(request.user.user_post_likes, pk=pk)
        return super().destroy(request, *args, **kwargs)


class PostLikeListByUserAPIView(generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = PostLikeListSerializer

    def get_queryset(self):
        if getattr(self, 'swagger_fake_view', False):
            return PostLike.objects.none()
        user_id = self.kwargs['pk']
        return PostLike.objects.filter(user=user_id)

    @swagger_auto_schema(operation_summary="Retrieve a list of all post likes by user id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)


class PostLikeListByPostAPIView(generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = PostLikeListSerializer

    def get_queryset(self):
        if getattr(self, 'swagger_fake_view', False):
            return PostLike.objects.none()
        post_id = self.kwargs['pk']
        return PostLike.objects.filter(post=post_id)

    @swagger_auto_schema(operation_summary="Retrieve a list of all post likes by post id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

# FORUM POST FOLLOW
# LIST TO CREATE NEW FOLLOW
# DETAIL TO DELETE POST FOLLOW
# HAVE LIST POST FOLLOW FROM USER ID OR POST ID


class PostFollowListAPIView(generics.ListCreateAPIView):
    queryset = PostFollow.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = PostFollowListSerializer

    @swagger_auto_schema(operation_summary="Retrieve a list of all post follows")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Save a new post follow")
    def post(self, request, *args, **kwargs):
        return super().post(request, *args, **kwargs)

    def perform_create(self, serializer):
        return serializer.save(user=self.request.user)


class PostFollowDetailAPIView(generics.DestroyAPIView):
    queryset = PostFollow.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = PostFollowDetailSerializer

    @swagger_auto_schema(operation_summary="Delete the specified post follow by post follow id")
    def delete(self, request, pk, *args, **kwargs):
        get_object_or_404(request.user.user_post_follows, pk=pk)
        return super().destroy(request, *args, **kwargs)


class PostFollowListByUserAPIView(generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = PostFollowListSerializer

    def get_queryset(self):
        if getattr(self, 'swagger_fake_view', False):
            return PostFollow.objects.none()
        user_id = self.kwargs['pk']
        return PostFollow.objects.filter(user=user_id)

    @swagger_auto_schema(operation_summary="Retrieve a list of all post follows by user id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)


class PostFollowListByPostAPIView(generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = PostFollowListSerializer

    def get_queryset(self):
        if getattr(self, 'swagger_fake_view', False):
            return PostFollow.objects.none()
        post_id = self.kwargs['pk']
        return PostFollow.objects.filter(post=post_id)

    @swagger_auto_schema(operation_summary="Retrieve a list of all post follows by post id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

# FORUM COMMENT
# HAVE LIST COMMENT BY USER


class CommentListAPIView(generics.ListCreateAPIView):
    queryset = Comment.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = CommentListSerializer
    filter_backends = (filters.SearchFilter,)
    search_fields = ('body',)

    @swagger_auto_schema(operation_summary="Retrieve a list of all comments")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Save a new comment")
    def post(self, request, *args, **kwargs):
        return super().post(request, *args, **kwargs)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class CommentDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Comment.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = CommentDetailSerializer

    @swagger_auto_schema(operation_summary="Retrieve a comment detail for this comment id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update an existing comment detail for this comment id")
    def put(self, request, pk, *args, **kwargs):
        get_object_or_404(request.user.comments, pk=pk)
        return super().put(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update partial an existing comment detail for this comment id")
    def patch(self, request, pk, *args, **kwargs):
        get_object_or_404(request.user.comments, pk=pk)
        return super().patch(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Delete the specified comment by comment id")
    def delete(self, request, pk, *args, **kwargs):
        get_object_or_404(request.user.comments, pk=pk)
        return super().destroy(request, *args, **kwargs)


class CommentListByUserAPIView(generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = CommentListSerializer

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
    serializer_class = CommentListByPostSerializer

    def get_queryset(self):
        if getattr(self, 'swagger_fake_view', False):
            return Comment.objects.none()
        post_id = self.kwargs['pk']
        return Comment.objects.filter(post=post_id, parent__isnull=True)

    @swagger_auto_schema(operation_summary="Retrieve a list of all comments by post id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

# FORUM COMMENT LIKE
# LIST TO CREATE NEW LIKE
# DETAIL TO UPDATE LIKE TO DISLIKE OR REVERSE
# DETAIL ALSO DELETE LIKE
# HAVE LIST COMMENT LIKE FROM USER ID OR COMMENT ID


class CommentLikeListAPIView(generics.ListCreateAPIView):
    queryset = CommentLike.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = CommentLikeListSerializer

    @swagger_auto_schema(operation_summary="Retrieve a list of all comment likes")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Save a new comment like")
    def post(self, request, *args, **kwargs):
        return super().post(request, *args, **kwargs)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class CommentLikeDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = CommentLike.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = CommentLikeDetailSerializer

    @swagger_auto_schema(operation_summary="Retrieve a comment like detail for this comment like id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update an existing comment like detail for this comment like id")
    def put(self, request, pk, *args, **kwargs):
        get_object_or_404(request.user.user_comment_likes, pk=pk)
        return super().put(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update partial an existing comment like detail for this comment like id")
    def patch(self, request, pk, *args, **kwargs):
        get_object_or_404(request.user.user_comment_likes, pk=pk)
        return super().patch(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Delete the specified comment like by comment like id")
    def delete(self, request, pk, *args, **kwargs):
        get_object_or_404(request.user.user_comment_likes, pk=pk)
        return super().destroy(request, *args, **kwargs)


class CommentLikeListByUserAPIView(generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = CommentLikeListSerializer

    def get_queryset(self):
        if getattr(self, 'swagger_fake_view', False):
            return CommentLike.objects.none()
        user_id = self.kwargs['pk']
        return CommentLike.objects.filter(user=user_id)

    @swagger_auto_schema(operation_summary="Retrieve a list of all comment likes by user id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)


class CommentLikeListByCommentAPIView(generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = CommentLikeListSerializer

    def get_queryset(self):
        if getattr(self, 'swagger_fake_view', False):
            return CommentLike.objects.none()
        comment_id = self.kwargs['pk']
        return CommentLike.objects.filter(post=comment_id)

    @swagger_auto_schema(operation_summary="Retrieve a list of all comments by comment id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)
