from django.urls import path
from .views import *

urlpatterns = [
    path("", FolderListAPIView.as_view()),
    path("<int:pk>/", FolderDetailAPIView.as_view())
]
