from django.shortcuts import get_object_or_404, render
from rest_framework import permissions, status, generics
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import UserProfileSerializer, UserSignUpSerializer, UserStatusSerializer
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


class UserDeleteAPIView(APIView):
    """Admin View To Delete User"""
    permission_classes = (permissions.IsAdminUser,)

    def delete(self, request, pk, format='json'):
        user = get_object_or_404(User, pk=pk)
        user.delete()
        return Response({'detail': 'User was deleted successfully.'}, status=status.HTTP_204_NO_CONTENT)


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
