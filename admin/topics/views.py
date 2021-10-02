from rest_framework import permissions, generics
from .serializers import *


class TopicListAPIView(generics.ListCreateAPIView):
    """Admin View To Get List Or Create Topic"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = Topic.objects.all()
    serializer_class = TopicAdminSerializer


class TopicDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    """Admin View To RetrieveUpdateDestroy Topic"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = Topic.objects.all()
    serializer_class = TopicAdminSerializer
