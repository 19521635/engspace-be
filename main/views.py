from django.shortcuts import render, get_object_or_404
from rest_framework import generics, permissions, status
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import FolderSerializer, SetDetailSerializer, SetSerializer, TopicSerializer, FolderSetSerializer
from .models import Folder, Topic, Set, SetDetail
# Create your views here.


class FolderListAPIView(generics.ListCreateAPIView):
    serializer_class = FolderSerializer
    queryset = Folder.objects.all()

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class FolderDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = FolderSerializer
    queryset = Folder.objects.all()

    def put(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.folder, pk=pk)
        return self.update(request, *args, **kwargs)

    def patch(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.folder, pk=pk)
        return self.partial_update(request, *args, **kwargs)

    def delete(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.folder, pk=pk)
        return self.destroy(request, *args, **kwargs)


class FolderSetAPIVIew(APIView):

    def post(self, request, format='json'):
        serializer = FolderSetSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        folder = get_object_or_404(
            request.user.folder, pk=request.data['folder_id'])
        set = get_object_or_404(Set, pk=request.data['set_id'])
        Folder.add(folder, set)
        return Response(serializer.data, status=status.HTTP_201_CREATED)

    def delete(self, request, format='json'):
        serializer = FolderSetSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        folder = get_object_or_404(
            request.user.folder, pk=request.data['folder_id'])
        set = get_object_or_404(folder.sets, pk=request.data['set_id'])
        Folder.remove(folder, set)
        return Response(serializer.data, status=status.HTTP_204_NO_CONTENT)


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

    def put(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.topic, pk=pk)
        return self.update(request, *args, **kwargs)

    def patch(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.topic, pk=pk)
        return self.partial_update(request, *args, **kwargs)

    def delete(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.topic, pk=pk)
        return self.destroy(request, *args, **kwargs)


class SetListAPIView(generics.ListCreateAPIView):
    serializer_class = SetSerializer
    queryset = Set.objects.all()

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class SetDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = SetSerializer
    queryset = Set.objects.all()

    def put(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.set, pk=pk)
        return self.update(request, *args, **kwargs)

    def patch(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.set, pk=pk)
        return self.partial_update(request, *args, **kwargs)

    def delete(self, request, pk, *args, **kwargs):
        instance = get_object_or_404(
            request.user.set, pk=pk)
        return self.destroy(request, *args, **kwargs)


class SetDetailListAPIView(generics.ListCreateAPIView):
    serializer_class = SetDetailSerializer
    queryset = SetDetail.objects.all()


class SetDetailDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = SetDetailSerializer
    queryset = SetDetail.objects.all()
    """Fix this, no attribute 'set_detail'"""

    def put(self, request, pk, *args, **kwargs):
        set_detail = get_object_or_404(SetDetail, pk=pk)
        instance = get_object_or_404(
            request.user.set, pk=set_detail.set.id)
        return self.update(request, *args, **kwargs)

    def patch(self, request, pk, *args, **kwargs):
        set_detail = get_object_or_404(SetDetail, pk=pk)
        instance = get_object_or_404(
            request.user.set, pk=set_detail.set.id)
        return self.partial_update(request, *args, **kwargs)

    def delete(self, request, pk, *args, **kwargs):
        set_detail = get_object_or_404(SetDetail, pk=pk)
        instance = get_object_or_404(
            request.user.set, pk=set_detail.set.id)
        return self.destroy(request, *args, **kwargs)
