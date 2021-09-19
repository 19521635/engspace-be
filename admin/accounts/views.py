from django.shortcuts import get_object_or_404
from rest_framework import permissions, status
from rest_framework.views import APIView
from rest_framework.response import Response
from accounts.models import User


class UserDeleteAPIView(APIView):
    """Admin View To Delete User"""
    permission_classes = (permissions.IsAdminUser,)

    def delete(self, request, pk, format='json'):
        user = get_object_or_404(User, pk=pk)
        user.delete()
        return Response({'detail': 'User was deleted successfully.'}, status=status.HTTP_204_NO_CONTENT)
