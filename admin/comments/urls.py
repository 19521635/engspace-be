from django.urls import path
from .views import *

urlpatterns = [
    # POST
    # Comment
    path("", CommentListAPIView.as_view(), name="comments_list"),
    path("<int:pk>/", CommentDetailAPIView.as_view(),
         name="comment_detail"),
    path("user/<int:pk>/", CommentListByUserAPIView.as_view(),
         name="comments_list_by_user"),
    path("post/<int:pk>/", CommentListByPostAPIView.as_view(),
         name="comments_list_by_post"),
]
