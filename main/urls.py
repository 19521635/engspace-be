from django.urls import path
from .views import *

urlpatterns = [
    path("folders/", FolderListAPIView.as_view()),
    path("folders/<int:pk>/", FolderDetailAPIView.as_view()),
    path("folders/user/<int:pk>/", FolderListByUserAPIView.as_view()),
    path("topics/", TopicListAPIView.as_view()),
    path("topics/<int:pk>/", TopicDetailAPIView.as_view()),
    path("sets/", SetListAPIView.as_view()),
    path("sets/<int:pk>/", SetDetailAPIView.as_view()),
    path("sets/user/<int:pk>/", SetListByUserAPIView.as_view()),
    path("set-details/", SetDetailListAPIView.as_view()),
    path("set-details/<int:pk>/", SetDetailDetailAPIView.as_view()),
    path("folder-sets/", FolderSetAPIVIew.as_view())
]
