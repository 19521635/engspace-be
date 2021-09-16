from django.urls import path
from rest_framework_simplejwt import views as jwt_views
from .views import TestAPIView, UserCreateAPIView, UserDeleteAPIView
urlpatterns = [
    path("login/", jwt_views.TokenObtainPairView.as_view(), name="token_create"),
    path("login/refresh/", jwt_views.TokenRefreshView.as_view(), name="token_refresh"),
    path("register/", UserCreateAPIView.as_view(), name="user_create"),
    path("delete/<int:pk>/", UserDeleteAPIView.as_view(), name="user_delete"),
    path("test/", TestAPIView.as_view(),)
]
