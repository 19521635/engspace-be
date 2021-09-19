from django.shortcuts import get_object_or_404, render
from rest_framework import permissions, status, generics
from rest_framework.response import Response
from .serializers import UserFollowingSerializer, UserProfileSerializer, UserSignUpSerializer, UserStatusSerializer
from .models import User
# Create your views here.


class UserSignUpAPIView(generics.CreateAPIView):
    """View To Create New User"""
    permission_classes = (permissions.AllowAny,)
    queryset = User.objects.all()
    serializer_class = UserSignUpSerializer

    def post(self, request, *args, **kwargs):
        serializers = UserSignUpSerializer(data=request.data)
        if serializers.is_valid(raise_exception=True):
            user = serializers.save()
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


class UserStatusAPIView(generics.RetrieveAPIView):
    """View To Get User Status"""
    serializer_class = UserStatusSerializer

    def get(self, request, *args, **kwargs):
        instance = request.user
        data = {'is_active': instance.is_active, 'is_staff': instance.is_staff}
        return Response(data, status=status.HTTP_200_OK)


class UserFollowingAPIView(generics.RetrieveAPIView):
    """View To Get User Followers/Following"""
    serializer_class = UserFollowingSerializer
    lookup_field = ('user_id')

    def get(self, request, pk=None, *args, **kwargs):
        if pk is None:
            instance = request.user
        else:
            instance = get_object_or_404(User, pk=pk)
        serializers = self.get_serializer(instance)
        return Response(serializers.data)
