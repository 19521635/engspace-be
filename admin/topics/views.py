from rest_framework import permissions, generics
from drf_yasg.utils import swagger_auto_schema
from .serializers import *


class TopicListAPIView(generics.ListCreateAPIView):
    """Admin View To Get List Or Create Topic"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = Topic.objects.all()
    serializer_class = TopicAdminSerializer

    @swagger_auto_schema(operation_summary="Retrieve a list of all topics")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Save a new topic")
    def post(self, request, *args, **kwargs):
        return super().post(request, *args, **kwargs)


class TopicDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    """Admin View To RetrieveUpdateDestroy Topic"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = Topic.objects.all()
    serializer_class = TopicAdminSerializer

    @swagger_auto_schema(operation_summary="Retrieve a topic detail for this topic id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update an existing topic detail for this topic id")
    def put(self, request, *args, **kwargs):
        return super().put(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update partial an existing topic detail for this topic id")
    def patch(self, request, *args, **kwargs):
        return super().patch(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Delete the specified topic by topic id")
    def delete(self, request, *args, **kwargs):
        return super().delete(request, *args, **kwargs)
