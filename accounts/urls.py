from django.urls import path
from django.urls.conf import include
from rest_framework_simplejwt import views as jwt_views
from .views import *

follow_urlpatterns = [
    path("", UserFollowingCreateAPIView.as_view(), name="user_follow_create"),
    path("<int:pk>/", UserFollowingAPIView.as_view(),
         name="user_follow"),
]

login_urlpatterns = [
    path("", CustomTokenObtainPairView.as_view(), name="token_create"),
    path("refresh/", jwt_views.TokenRefreshView.as_view(), name="token_refresh"),
]

profile_urlpatterns = [
    path("", UserProfileAPIView.as_view()),
    path("<int:pk>/", UserProfileDetailAPIView.as_view()),
    path('change_password/<int:pk>/', ChangePasswordAPIView.as_view()),
]

urlpatterns = [
    path("", UserListAPIView.as_view()),
    path("<int:pk>/", UserDetailAPIView.as_view()),
    path("login/", include(login_urlpatterns)),
    path("register/", UserSignUpAPIView.as_view(), name="user_create"),
    path("all/", UserProfileListAPIView.as_view(), name="user_list"),
    path("profile/", include(profile_urlpatterns)),
    path("status/", UserStatusAPIView.as_view(), name="user_status"),
    path("follow/", include(follow_urlpatterns)),
    path("reset-password/<email>/",
         ResetPasswordAPIView.as_view(), name="reset_password")
]
