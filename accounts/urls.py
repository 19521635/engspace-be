from django.urls import path
from rest_framework_simplejwt import views as jwt_views
from .views import UserSignUpAPIView, UserDeleteAPIView, UserProfileAPIView, UserStatusAPIView
urlpatterns = [
    path("login/", jwt_views.TokenObtainPairView.as_view(), name="token_create"),
    path("login/refresh/", jwt_views.TokenRefreshView.as_view(), name="token_refresh"),
    path("register/", UserSignUpAPIView.as_view(), name="user_create"),
    path("profile/", UserProfileAPIView.as_view(), name="user_profile"),
    path("status/", UserStatusAPIView.as_view(), name="user_status"),
    path("delete/<int:pk>/", UserDeleteAPIView.as_view(), name="user_delete"),
]
