from rest_framework import generics, permissions
from django.shortcuts import get_object_or_404
from .serializers import *
from .models import *
# Create your views here.

# FORUM POST


class PostListAPIView(generics.ListCreateAPIView):
    queryset = Post.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = PostListSerializer

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class PostDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Post.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    serializer_class = PostDetailSerializer

    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    def put(self, request, pk, *args, **kwargs):
        get_object_or_404(request.user.posts, pk=pk)
        return super().put(request, *args, **kwargs)

    def patch(self, request, pk, *args, **kwargs):
        get_object_or_404(request.user.posts, pk=pk)
        return super().patch(request, *args, **kwargs)

    def destroy(self, request, pk, *args, **kwargs):
        get_object_or_404(request.user.posts, pk=pk)
        return super().destroy(request, *args, **kwargs)
