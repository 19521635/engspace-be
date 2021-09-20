from django.urls import path
from .views import FolderListAPIView, FolderDetailAPIView, TopicListAPIView, TopicDetailAPIView

urlpatterns = [
    path("folders/", FolderListAPIView.as_view()),
    path("folders/<int:pk>/", FolderDetailAPIView.as_view()),
    path("topics/", TopicListAPIView.as_view()),
    path("topics/<int:pk>/", TopicDetailAPIView.as_view()),
]
