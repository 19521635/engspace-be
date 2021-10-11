from django.shortcuts import get_object_or_404
from rest_framework import permissions, status, generics
from rest_framework.views import APIView
from rest_framework.response import Response
from accounts.models import *
from .serializers import *


class UserListAPIView(generics.ListCreateAPIView):
    """Admin View To Get List Or Create User"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = User.objects.all()
    serializer_class = UserListAdminSerializer


class UserDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    """Admin View To RetrieveUpdateDestroy User"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = User.objects.all()
    serializer_class = UserDetailAdminSerializer


class UserProfileListAPIView(generics.ListCreateAPIView):
    """Admin View To Get List Or Create User Profile"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileListAdminSerializer


class UserProfileDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    """Admin View To RetrieveUpdateDestroy User Profile"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileDetailAdminSerializer
