from rest_framework import permissions, generics, filters
from drf_yasg.utils import swagger_auto_schema
from .serializers import *


class SetDetailListAPIView(generics.ListCreateAPIView):
    """Admin View To Get List Or Create Set Detail"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = SetDetail.objects.all()
    serializer_class = SetDetailListAdminSerializer
    filter_backends = (filters.SearchFilter,)
    search_fields = ('term', 'definition')

    @swagger_auto_schema(operation_summary="Retrieve a list of all set details")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Save a new set detail")
    def post(self, request, *args, **kwargs):
        return super().post(request, *args, **kwargs)


class SetDetailDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    """Admin View To RetrieveUpdateDestroy Set Detail"""
    permission_classes = (permissions.IsAdminUser,)
    queryset = SetDetail.objects.all()
    serializer_class = SetDetailListAdminSerializer

    @swagger_auto_schema(operation_summary="Retrieve a set detail detail for this set detail id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update an existing set detail detail for this set detail id")
    def put(self, request, *args, **kwargs):
        return super().put(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update partial an existing set detail detail for this set detail id")
    def patch(self, request, *args, **kwargs):
        return super().patch(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Delete the specified set detail by set detail id")
    def delete(self, request, *args, **kwargs):
        return super().delete(request, *args, **kwargs)
