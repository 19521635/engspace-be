from django.shortcuts import get_object_or_404, render
from rest_framework import permissions, status, generics
from rest_framework.response import Response
from .serializers import UserFollowingSerializer, UserProfileDetailSerializer, UserProfileSerializer, UserProfileListSerializer, UserSignUpSerializer, UserStatusSerializer, UserFollowingCreateSerializer
from .models import User, UserFollowing
# Create your views here.


class UserSignUpAPIView(generics.CreateAPIView):
    """View To Create New User"""
    permission_classes = (permissions.AllowAny,)
    queryset = User.objects.all()
    serializer_class = UserSignUpSerializer

    def post(self, request, *args, **kwargs):
        serializers = UserSignUpSerializer(data=request.data)
        if serializers.is_valid(raise_exception=True):
            serializers.save()
            return Response(serializers.data, status=status.HTTP_201_CREATED)


class UserProfileAPIView(generics.RetrieveUpdateAPIView):
    """View To Get Or Update User Profile"""
    serializer_class = UserProfileSerializer
    queryset = User.objects.all()

    def get(self, request, *args, **kwargs):
        instance = self.request.user
        serializer = self.get_serializer(instance)
        return Response(serializer.data)

    def update(self, request, *args, **kwargs):
        instance = self.request.user
        request.data._mutable = True
        request.data['username'] = instance.username
        request.data._mutable = False
        serializer = UserProfileSerializer(instance, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)


class UserProfileListAPIView(generics.ListAPIView):
    """View To Get List Of All Users"""
    queryset = User.objects.all()
    serializer_class = UserProfileListSerializer


class UserProfileDetailAPIView(generics.RetrieveAPIView):
    """View To Get Someone Profile Detail"""
    queryset = User.objects.all()
    serializer_class = UserProfileDetailSerializer


class UserStatusAPIView(generics.RetrieveAPIView):
    """View To Get User Status"""
    serializer_class = UserStatusSerializer

    def get(self, request, *args, **kwargs):
        instance = request.user
        data = {'is_active': instance.is_active, 'is_staff': instance.is_staff}
        return Response(data, status=status.HTTP_200_OK)


class UserFollowingCreateAPIView(generics.CreateAPIView):
    """View To Create New User Follow"""
    serializer_class = UserFollowingCreateSerializer

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class UserFollowingAPIView(generics.RetrieveUpdateDestroyAPIView):
    """View To Get User Followers/Following"""
    serializer_class = UserFollowingSerializer
    queryset = UserFollowing.objects.all()

    def get(self, request, pk, *args, **kwargs):
        if pk is None:
            user = request.user
        else:
            user = get_object_or_404(User, pk=pk)
        serializer = self.get_serializer(user)
        return Response(serializer.data)

    def patch(self, request, pk, *args, **kwargs):
        if pk is None:
            pk = request.user.id
        user = get_object_or_404(User, pk=pk)
        if user != request.user:
            return Response({'detail': 'You do not have permission to access this follow.'}, status=status.HTTP_403_FORBIDDEN)
        serializer = self.get_serializer(
            user, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)

    def put(self, request, *args, **kwargs):
        return self.patch(request, *args, **kwargs)

    def delete(self, request, pk, *args, **kwargs):
        if pk is None:
            pk = request.user.id
        userfollowing = get_object_or_404(
            UserFollowing, user=request.user, following_user=pk)
        userfollowing.delete()
        return Response({'detail': 'Follow deleted.'}, status=status.HTTP_204_NO_CONTENT)
