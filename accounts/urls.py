from django.urls import path
from django.urls.conf import include
from rest_framework_simplejwt import views as jwt_views
from .views import UserSignUpAPIView, UserProfileAPIView, UserStatusAPIView, UserFollowingAPIView

follow_urlpatterns = [
    path("", UserFollowingAPIView.as_view(), name="user_follow"),
    path("<int:pk>", UserFollowingAPIView.as_view(),
         name="user_follow_with_id"),
]

login_urlpatterns = [
    path("", jwt_views.TokenObtainPairView.as_view(), name="token_create"),
    path("refresh/", jwt_views.TokenRefreshView.as_view(), name="token_refresh"),
]

urlpatterns = [
    path("login/", include(login_urlpatterns)),
    path("register/", UserSignUpAPIView.as_view(), name="user_create"),
    path("profile/", UserProfileAPIView.as_view(), name="user_profile"),
    path("status/", UserStatusAPIView.as_view(), name="user_status"),
    path("follow/", include(follow_urlpatterns)),
]
