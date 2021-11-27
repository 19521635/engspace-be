from django.shortcuts import render, get_object_or_404
from rest_framework import generics, permissions, status, filters
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.exceptions import ParseError
from rest_framework.parsers import FileUploadParser
from .serializers import *
from .models import *
from PIL import Image
from drf_yasg.utils import swagger_auto_schema
# Create your views here.


class FolderListAPIView(generics.ListCreateAPIView):
    serializer_class = FolderListSerializer
    queryset = Folder.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    filter_backends = (filters.SearchFilter,)
    search_fields = ('name', 'description')

    @swagger_auto_schema(operation_summary="Retrieve a list of all folders")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Save a new folder")
    def post(self, request, *args, **kwargs):
        return super().post(request, *args, **kwargs)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class FolderDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = FolderSerializer
    queryset = Folder.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    @swagger_auto_schema(operation_summary="Retrieve a folder detail for this folder id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update an existing folder detail for this folder id")
    def put(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.folders, pk=pk)
        return self.update(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update partial an existing folder detail for this folder id")
    def patch(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.folders, pk=pk)
        return self.partial_update(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Delete the specified folder by folder id")
    def delete(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.folders, pk=pk)
        return self.destroy(request, *args, **kwargs)


class FolderListByUserAPIView(generics.ListAPIView):
    serializer_class = FolderSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def get_queryset(self):
        if getattr(self, 'swagger_fake_view', False):
            return Folder.objects.none()
        user_id = self.kwargs['pk']
        return Folder.objects.filter(user=user_id)

    @swagger_auto_schema(operation_summary="Retrieve a list of all folders by user id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)


class FolderSetAPIVIew(APIView):

    @swagger_auto_schema(operation_summary="Save an existing set for this folder id")
    def post(self, request, format='json'):
        serializer = FolderSetSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        folder = get_object_or_404(
            request.user.folders, pk=request.data['folder_id'])
        set = get_object_or_404(Set, pk=request.data['set_id'])
        Folder.add(folder, set)
        return Response(serializer.data, status=status.HTTP_201_CREATED)

    @swagger_auto_schema(operation_summary="Delete the specified set in folder by set id and folder id")
    def delete(self, request, format='json'):
        serializer = FolderSetSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        folder = get_object_or_404(
            request.user.folders, pk=request.data['folder_id'])
        set = get_object_or_404(folder.sets, pk=request.data['set_id'])
        Folder.remove(folder, set)
        return Response(serializer.data, status=status.HTTP_204_NO_CONTENT)


class TopicCustomPermissions(permissions.BasePermission):
    def has_permission(self, request, view):
        if request.method in permissions.SAFE_METHODS:
            return True
        else:
            return bool(request.user and request.user.is_staff)


class TopicListAPIView(generics.ListCreateAPIView):
    serializer_class = TopicListSerializer
    queryset = Topic.objects.all()
    permission_classes = (TopicCustomPermissions,)
    filter_backends = (filters.SearchFilter,)
    search_fields = ('name', 'description')

    @swagger_auto_schema(operation_summary="Retrieve a list of all topics")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Save a new topic")
    def post(self, request, *args, **kwargs):
        return super().post(request, *args, **kwargs)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class TopicDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = TopicSerializer
    queryset = Topic.objects.all()
    permission_classes = (TopicCustomPermissions,)

    @swagger_auto_schema(operation_summary="Retrieve a topic detail for this topic id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update an existing topic detail for this topic id")
    def put(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.topics, pk=pk)
        return self.update(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update partial an existing topic detail for this topic id")
    def patch(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.topics, pk=pk)
        return self.partial_update(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Delete the specified topic by topic id")
    def delete(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.topics, pk=pk)
        return self.destroy(request, *args, **kwargs)


class SetListAPIView(generics.ListCreateAPIView):
    serializer_class = SetListSerializer
    queryset = Set.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    filter_backends = (filters.SearchFilter,)
    search_fields = ('name', 'description')

    @swagger_auto_schema(operation_summary="Retrieve a list of all sets")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Save a new set")
    def post(self, request, *args, **kwargs):
        return super().post(request, *args, **kwargs)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class SetDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = SetSerializer
    queryset = Set.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    @swagger_auto_schema(operation_summary="Retrieve a set detail for this set id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update an existing set detail for this set id")
    def put(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.sets, pk=pk)
        return self.update(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update partial an existing set detail for this set id")
    def patch(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.sets, pk=pk)
        return self.partial_update(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Delete the specified set by set id")
    def delete(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.sets, pk=pk)
        return self.destroy(request, *args, **kwargs)


class SetListByUserAPIView(generics.ListAPIView):
    serializer_class = SetListSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def get_queryset(self):
        if getattr(self, 'swagger_fake_view', False):
            return Set.objects.none()
        user_id = self.kwargs['pk']
        return Set.objects.filter(user=user_id)

    @swagger_auto_schema(operation_summary="Retrieve a list of all sets by user id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)


class SetDetailListAPIView(generics.ListCreateAPIView):
    serializer_class = SetDetailSerializer
    queryset = SetDetail.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    @swagger_auto_schema(operation_summary="Retrieve a list of all set details")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Save a new set detail")
    def post(self, request, *args, **kwargs):
        serializer = SetDetailSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        get_object_or_404(request.user.sets, pk=request.data['set'])
        return super().post(request, *args, **kwargs)


class SetDetailDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = SetDetailSerializer
    queryset = SetDetail.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    @swagger_auto_schema(operation_summary="Retrieve a set detail for this set detail id")
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update an existing set detail for this set detail id")
    def put(self, request, pk, *args, **kwargs):
        set_detail = get_object_or_404(SetDetail, pk=pk)
        instance = get_object_or_404(
            request.user.sets, pk=set_detail.set.id)
        return self.update(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Update partial an existing set detail for this set detail id")
    def patch(self, request, pk, *args, **kwargs):
        set_detail = get_object_or_404(SetDetail, pk=pk)
        instance = get_object_or_404(
            request.user.sets, pk=set_detail.set.id)
        return self.partial_update(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Delete the specified set detail by set detail id")
    def delete(self, request, pk, *args, **kwargs):
        set_detail = get_object_or_404(SetDetail, pk=pk)
        instance = get_object_or_404(
            request.user.sets, pk=set_detail.set.id)
        return self.destroy(request, *args, **kwargs)


class ImageUploadParser(FileUploadParser):
    media_type = 'image/*'


class MyUploadView(generics.UpdateAPIView):
    parser_class = (ImageUploadParser,)
    serializer_class = UploadImageSerializer

    @swagger_auto_schema(operation_summary="Upload new image using put method")
    def put(self, request):
        if 'file' not in request.data:
            raise ParseError("Empty content")

        f = request.data['file']

        try:
            img = Image.open(f)
            img.verify()
        except:
            raise ParseError("Unsupported image type")

        instance = UploadImage.objects.create(name=f.name, image=f)
        serializer = self.get_serializer(instance)
        return Response(serializer.data)

    @swagger_auto_schema(operation_summary="Upload new image using patch method")
    def patch(self, request, *args, **kwargs):
        if 'file' not in request.data:
            raise ParseError("Empty content")

        f = request.data['file']

        try:
            img = Image.open(f)
            img.verify()
        except:
            raise ParseError("Unsupported image type")

        instance = UploadImage.objects.create(name=f.name, image=f)
        serializer = self.get_serializer(instance)
        return Response(serializer.data)
