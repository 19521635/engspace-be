from django.shortcuts import get_object_or_404
from rest_framework import permissions, status, generics
from rest_framework.views import APIView
from rest_framework.response import Response
from drf_yasg.utils import swagger_auto_schema
from accounts.models import *
from .serializers import *


class UserListAPIView(generics.ListCreateAPIView):
    """Admin View To Get List Or Create User"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = User.objects.all()
    serializer_class = UserListAdminSerializer

    @swagger_auto_schema(operation_summary="Retrieve a list of all users")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Save a new user")
    def post(self, request, *args, **kwargs):
        return super().post(request, *args, **kwargs)


class UserDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    """Admin View To RetrieveUpdateDestroy User"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = User.objects.all()
    serializer_class = UserDetailAdminSerializer

    @swagger_auto_schema(operation_summary="Retrieve an user for this user id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update an existing user for this user id")
    def put(self, request, *args, **kwargs):
        return super().put(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update partial an existing user for this user id")
    def patch(self, request, *args, **kwargs):
        return super().patch(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Delete the specified user by user id")
    def delete(self, request, *args, **kwargs):
        return super().delete(request, *args, **kwargs)


class UserProfileListAPIView(generics.ListAPIView):
    """Admin View To Get List Or Create User Profile"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileListAdminSerializer

    @swagger_auto_schema(operation_summary="Retrieve a list of all user's profiles")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)


class UserProfileDetailAPIView(generics.RetrieveUpdateAPIView):
    """Admin View To RetrieveUpdateDestroy User Profile"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileDetailAdminSerializer

    @swagger_auto_schema(operation_summary="Retrieve an user profile for this user id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update an existing user profile for this user id")
    def put(self, request, *args, **kwargs):
        return super().put(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update partial an existing user profile for this user id")
    def patch(self, request, *args, **kwargs):
        return super().patch(request, *args, **kwargs)
