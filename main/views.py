from django.shortcuts import render
from rest_framework import generics, permissions
from .serializers import FolderSerializer, TopicSerializer
from .models import Folder, Topic
# Create your views here.


class FolderListAPIView(generics.ListCreateAPIView):
    serializer_class = FolderSerializer
    queryset = Folder.objects.all()

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class FolderDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = FolderSerializer
    queryset = Folder.objects.all()


class TopicCustomPermissions(permissions.BasePermission):
    def has_permission(self, request, view):
        if request.method == 'GET':
            return bool(request.user and request.user.is_authenticated)
        else:
            return bool(request.user and request.user.is_staff)


class TopicListAPIView(generics.ListCreateAPIView):
    serializer_class = TopicSerializer
    queryset = Topic.objects.all()
    permission_classes = (TopicCustomPermissions,)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class TopicDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = TopicSerializer
    queryset = Topic.objects.all()
    permission_classes = (TopicCustomPermissions,)
