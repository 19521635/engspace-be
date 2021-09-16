from django.shortcuts import get_object_or_404, render
from rest_framework import permissions, status
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import UserSerializer
from .models import User
# Create your views here.


class TestAPIView(APIView):
    def get(self, request):
        return Response("oke")


class UserCreateAPIView(APIView):
    permission_classes = (permissions.AllowAny,)

    def post(self, request, format='json'):
        serializers = UserSerializer(data=request.data)
        if serializers.is_valid():
            user = serializers.save()
            if user:
                json = serializers.data
                return Response(json, status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)


class UserDeleteAPIView(APIView):
    permission_classes = (permissions.IsAdminUser,)

    def delete(self, request, pk, format='json'):
        user = get_object_or_404(User, pk=pk)
        user.delete()
        return Response({'detail': 'User was deleted successfully.'}, status=status.HTTP_204_NO_CONTENT)
