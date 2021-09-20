from django.urls import path
from django.urls.conf import include
from rest_framework_simplejwt import views as jwt_views
from .views import UserSignUpAPIView, UserProfileAPIView, UserProfileListAPIView, UserProfileDetailAPIView, UserStatusAPIView, UserFollowingAPIView, UserFollowingCreateAPIView

follow_urlpatterns = [
    path("", UserFollowingCreateAPIView.as_view(), name="user_follow_create"),
    path("<int:pk>/", UserFollowingAPIView.as_view(),
         name="user_follow"),
]

login_urlpatterns = [
    path("", jwt_views.TokenObtainPairView.as_view(), name="token_create"),
    path("refresh/", jwt_views.TokenRefreshView.as_view(), name="token_refresh"),
]

profile_urlpatterns = [
    path("", UserProfileAPIView.as_view()),
    path("<int:pk>/", UserProfileDetailAPIView.as_view()),
]

urlpatterns = [
    path("login/", include(login_urlpatterns)),
    path("register/", UserSignUpAPIView.as_view(), name="user_create"),
    path("all/", UserProfileListAPIView.as_view(), name="user_list"),
    path("profile/", include(profile_urlpatterns)),
    path("status/", UserStatusAPIView.as_view(), name="user_status"),
    path("follow/", include(follow_urlpatterns)),
]
