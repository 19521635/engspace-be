from django.urls import path
from .views import *

urlpatterns = [
    # POST
    path("posts/", PostListAPIView.as_view(), name="posts_list"),
    path("posts/<int:pk>/", PostDetailAPIView.as_view(), name="post_detail"),
    path("posts/user/<int:pk>/", PostListByUserAPIView.as_view(),
         name="posts_list_by_user"),
    # POST LIKE
    path("post-likes/", PostLikeListAPIView.as_view(), name="post_likes_list"),
    path("post-likes/<int:pk>/", PostLikeDetailAPIView.as_view(),
         name="post_like_detail"),
    path("post-likes/user/<int:pk>/", PostLikeListByUserAPIView.as_view(),
         name="post_likes_list_by_user"),
    path("post-likes/post/<int:pk>/", PostLikeListByPostAPIView.as_view(),
         name="post_likes_list_by_post"),
    # POST FOLLOW
    path("post-follows/", PostFollowListAPIView.as_view(),
         name="post_follows_list"),
    path("post-follows/<int:pk>/", PostFollowDetailAPIView.as_view(),
         name="post_follow_detail"),
    path("post-follows/user/<int:pk>/", PostFollowListByUserAPIView.as_view(),
         name="post_follows_list_by_user"),
    path("post-follows/post/<int:pk>/", PostFollowListByPostAPIView.as_view(),
         name="post_follows_list_by_post"),
    # Comment
    path("comments/", CommentListAPIView.as_view(), name="comments_list"),
    path("comments/<int:pk>/", CommentDetailAPIView.as_view(),
         name="comment_detail"),
    path("comments/user/<int:pk>/", CommentListByUserAPIView.as_view(),
         name="comments_list_by_user"),
    path("comments/post/<int:pk>/", CommentListByPostAPIView.as_view(),
         name="comments_list_by_post"),
    # POST LIKE
    path("comment-likes/", CommentLikeListAPIView.as_view(),
         name="comment_likes_list"),
    path("comment-likes/<int:pk>/", CommentLikeDetailAPIView.as_view(),
         name="comment_like_detail"),
    path("comment-likes/user/<int:pk>/", CommentLikeListByUserAPIView.as_view(),
         name="comment_likes_list_by_user"),
    path("comment-likes/comment/<int:pk>/", CommentLikeListByCommentAPIView.as_view(),
         name="comment_likes_list_by_comment"),
]
