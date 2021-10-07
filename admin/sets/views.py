from rest_framework import permissions, generics
from .serializers import *


class SetListAPIView(generics.ListCreateAPIView):
    """Admin View To Get List Or Create Set"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = Set.objects.all()
    serializer_class = SetAdminSerializer


class SetDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    """Admin View To RetrieveUpdateDestroy Set"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = Set.objects.all()
    serializer_class = SetAdminSerializer
