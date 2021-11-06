from rest_framework import permissions, generics, filters
from drf_yasg.utils import swagger_auto_schema
from .serializers import *


class SetListAPIView(generics.ListCreateAPIView):
    """Admin View To Get List Or Create Set"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = Set.objects.all()
    serializer_class = SetAdminSerializer
    filter_backends = (filters.SearchFilter,)
    search_fields = ('name', 'description')

    @swagger_auto_schema(operation_summary="Retrieve a list of all sets")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Save a new set")
    def post(self, request, *args, **kwargs):
        return super().post(request, *args, **kwargs)


class SetDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    """Admin View To RetrieveUpdateDestroy Set"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = Set.objects.all()
    serializer_class = SetAdminSerializer

    @swagger_auto_schema(operation_summary="Retrieve a set detail for this set id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update an existing set detail for this set id")
    def put(self, request, *args, **kwargs):
        return super().put(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update partial an existing set detail for this set id")
    def patch(self, request, *args, **kwargs):
        return super().patch(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Delete the specified set by set id")
    def delete(self, request, *args, **kwargs):
        return super().delete(request, *args, **kwargs)
