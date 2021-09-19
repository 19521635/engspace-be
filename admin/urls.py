from django.urls import path
from .accounts.views import UserDeleteAPIView

urlpatterns = [
    path("user/delete/<int:pk>/", UserDeleteAPIView.as_view(),),
]
