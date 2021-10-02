from rest_framework import permissions, generics
from .serializers import *


class FolderListAPIView(generics.ListCreateAPIView):
    """Admin View To Get List Or Create Folder"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = Folder.objects.all()
    serializer_class = FolderAdminSerializer


class FolderDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    """Admin View To RetrieveUpdateDestroy Folder"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = Folder.objects.all()
    serializer_class = FolderAdminSerializer
