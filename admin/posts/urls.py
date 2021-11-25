from django.urls import path
from .views import *

urlpatterns = [
    # POST
    path("", PostListAPIView.as_view(), name="posts_list"),
    path("<int:pk>/", PostDetailAPIView.as_view(), name="post_detail"),
    path("user/<int:pk>/", PostListByUserAPIView.as_view(),
         name="posts_list_by_user"),
]
