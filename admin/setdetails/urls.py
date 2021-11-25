from django.urls import path
from .views import *

urlpatterns = [
    path("", SetDetailListAPIView.as_view()),
    path("<int:pk>/", SetDetailDetailAPIView.as_view())
]
