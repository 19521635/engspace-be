from django.urls import path
from .views import *

urlpatterns = [
    path("", UserListAPIView.as_view()),
    path("<int:pk>/", UserDetailAPIView.as_view()),
    path("profiles/", UserProfileListAPIView.as_view()),
    path("profiles/<int:pk>/", UserProfileDetailAPIView.as_view())
]
