from rest_framework import permissions, generics
from drf_yasg.utils import swagger_auto_schema
from .serializers import *


class FolderListAPIView(generics.ListCreateAPIView):
    """Admin View To Get List Or Create Folder"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = Folder.objects.all()
    serializer_class = FolderAdminSerializer

    @swagger_auto_schema(operation_summary="Retrieve a list of all folders")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Save a new folder")
    def post(self, request, *args, **kwargs):
        return super().post(request, *args, **kwargs)


class FolderDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    """Admin View To RetrieveUpdateDestroy Folder"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = Folder.objects.all()
    serializer_class = FolderAdminSerializer

    @swagger_auto_schema(operation_summary="Retrieve a folder detail for this folder id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update an existing folder detail for this folder id")
    def put(self, request, *args, **kwargs):
        return super().put(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update partial an existing folder detail for this folder id")
    def patch(self, request, *args, **kwargs):
        return super().patch(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Delete the specified folder by folder id")
    def delete(self, request, *args, **kwargs):
        return super().delete(request, *args, **kwargs)
