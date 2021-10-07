from django.urls import path
from .views import *

urlpatterns = [
    path("", SetListAPIView.as_view()),
    path("<int:pk>/", SetDetailAPIView.as_view())
]
