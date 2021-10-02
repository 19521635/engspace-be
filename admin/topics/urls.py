from django.urls import path
from .views import *

urlpatterns = [
    path("", TopicListAPIView.as_view()),
    path("<int:pk>/", TopicDetailAPIView.as_view())
]
