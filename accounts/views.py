from django.shortcuts import get_object_or_404
from rest_framework import permissions, status, generics
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework_simplejwt.views import TokenObtainPairView
from .serializers import *
from .models import User, UserFollowing
from drf_yasg.utils import swagger_auto_schema
from datetime import datetime
import base64
import pyotp
from django.core.mail import send_mail
from django.conf import settings
# Create your views here.


class CustomTokenObtainPairView(TokenObtainPairView):
    serializer_class = CustomTokenObtainPairSerializer


class UserSignUpAPIView(generics.CreateAPIView):
    """View To Create New User"""
    permission_classes = (permissions.AllowAny,)
    queryset = User.objects.all()
    serializer_class = UserSignUpSerializer

    @swagger_auto_schema(operation_summary="Save a new user")
    def post(self, request, *args, **kwargs):
        serializers = UserSignUpSerializer(data=request.data)
        if serializers.is_valid(raise_exception=True):
            serializers.save()
            return Response(serializers.data, status=status.HTTP_201_CREATED)


class UserProfileAPIView(generics.RetrieveUpdateAPIView):
    """View To Get Or Update User Profile"""
    serializer_class = UserProfileSerializer
    queryset = User.objects.all()

    @swagger_auto_schema(operation_id='users_myprofile_read', operation_summary="Get an owner's profile", tags=['users_profile'])
    def get(self, request, *args, **kwargs):
        instance = self.request.user
        serializer = self.get_serializer(instance)
        return Response(serializer.data)

    @swagger_auto_schema(operation_summary="Update an existing owner's profile", tags=['users_profile'])
    def put(self, request, *args, **kwargs):
        instance = self.request.user
        serializer = UserProfileSerializer(instance, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)

    @swagger_auto_schema(operation_summary="Update partial an existing owner's profile", tags=['users_profile'])
    def patch(self, request, *args, **kwargs):
        return self.put(request, *args, **kwargs)


class UserProfileListAPIView(generics.ListAPIView):
    """View To Get List Of All Users"""
    queryset = User.objects.all()
    serializer_class = UserProfileListSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    @swagger_auto_schema(operation_summary="Retrieve a list of all user profiles", tags=['users_profile'])
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)


class UserProfileDetailAPIView(generics.RetrieveAPIView):
    """View To Get Someone Profile Detail"""
    queryset = User.objects.all()
    serializer_class = UserProfileDetailSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    @swagger_auto_schema(operation_summary="Retrieve an user profile for this user id", tags=['users_profile'])
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)


class UserStatusAPIView(generics.RetrieveAPIView):
    """View To Get User Status"""
    serializer_class = UserStatusSerializer

    @swagger_auto_schema(operation_summary="Retrieve an owner's status", tags=['users_status'])
    def get(self, request, *args, **kwargs):
        instance = request.user
        data = {'is_active': instance.is_active, 'is_staff': instance.is_staff}
        return Response(data, status=status.HTTP_200_OK)


class UserFollowingCreateAPIView(generics.CreateAPIView):
    """View To Create New User Follow"""
    serializer_class = UserFollowingCreateSerializer

    @swagger_auto_schema(operation_summary="Save an owner's follow", tags=['users_follow'])
    def post(self, request, *args, **kwargs):
        return super().post(request, *args, **kwargs)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class UserFollowingAPIView(generics.RetrieveUpdateDestroyAPIView):
    """View To Get User Followers/Following"""
    serializer_class = UserFollowingSerializer
    queryset = UserFollowing.objects.all()

    @swagger_auto_schema(operation_summary="Retrieve a list of all followers/following for this user id", tags=['users_follow'])
    def get(self, request, pk, *args, **kwargs):
        if pk is None:
            user = request.user
        else:
            user = get_object_or_404(User, pk=pk)
        serializer = self.get_serializer(user)
        return Response(serializer.data)

    @swagger_auto_schema(operation_summary="Update partial an existing follow for this user id", tags=['users_follow'])
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

    @swagger_auto_schema(operation_summary="Update an existing follow for this user id", tags=['users_follow'])
    def put(self, request, *args, **kwargs):
        return self.patch(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Delete the specified follow by user id", tags=['users_follow'])
    def delete(self, request, pk, *args, **kwargs):
        if pk is None:
            pk = request.user.id
        userfollowing = get_object_or_404(
            UserFollowing, user=request.user, following_user=pk)
        userfollowing.delete()
        return Response({'detail': 'Follow deleted.'}, status=status.HTTP_204_NO_CONTENT)


class UserListAPIView(generics.ListAPIView):
    """View To Get List Of All Users"""
    permission_classes = (permissions.AllowAny,)
    queryset = User.objects.all()
    serializer_class = UserSerializer

    @swagger_auto_schema(operation_summary="Retrieve a list of all user details", tags=['users_detail'])
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)


class UserDetailAPIView(generics.RetrieveAPIView):
    """View To Get User Details"""
    permission_classes = (permissions.AllowAny,)
    serializer_class = UserSerializer
    queryset = User.objects.all()

    @swagger_auto_schema(operation_summary="Get an owner's profile", tags=['users_detail'])
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)


class ChangePasswordAPIView(generics.UpdateAPIView):
    """View To Change User Password"""
    serializer_class = ChangePasswordSerializer
    queryset = User.objects.all()

    @swagger_auto_schema(operation_summary="Change an existing owner's password", tags=['users_profile'])
    def put(self, request, *args, **kwargs):
        return super().put(request, *args, **kwargs)

    @swagger_auto_schema(operation_summary="Change an existing owner's password", tags=['users_profile'])
    def patch(self, request, *args, **kwargs):
        return super().patch(request, *args, **kwargs)


class GenerateKey:
    @staticmethod
    def returnValue(email):
        return str(email)+str(datetime.date(datetime.now()))+"7A5rUOiwPG596u1Og6HzmlW2tKs54GZK"


class ResetPasswordAPIView(APIView):
    permission_classes = [permissions.AllowAny]
    """View To Reset User Password"""
    @swagger_auto_schema(operation_summary="Send OTP code to reset password", tags=['send_otp'])
    def get(self, request, email, *args, **kwargs):
        user = get_object_or_404(User, email=email)
        keygen = GenerateKey()
        key = base64.b32encode(keygen.returnValue(email).encode())
        OTP = pyotp.TOTP(key, interval=120)
        subject = "Engspace - Reset your password"
        msg = f"Chào {user.username},\n\nMã xác nhận để khôi phục mật khẩu của bạn là: {OTP.now()}\n\nTrân trọng!\nEngspace"
        to = user.email
        res = send_mail(subject, msg, settings.DEFAULT_FROM_EMAIL, [to])
        if(res == 1):
            return Response({'OTP': ['Sent.']}, status=status.HTTP_200_OK)
        return Response({'OTP': ['Failed.']}, status=status.HTTP_400_BAD_REQUEST)

    @swagger_auto_schema(operation_summary="Reset password using OTP code", tags=['reset_password'])
    def post(self, request, email, *args, **kwargs):
        user = get_object_or_404(User, email=email)
        keygen = GenerateKey()
        key = base64.b32encode(keygen.returnValue(email).encode())
        OTP = pyotp.TOTP(key, interval=120)
        try:
            otp_data = request.data["OTP"]
        except KeyError:
            return Response({"OTP": ["This field is required."]}, status=status.HTTP_400_BAD_REQUEST)
        if OTP.verify(otp_data):  # Verifying the OTP
            serializer = ResetPasswordSerializer(data=request.data)
            serializer.context['email'] = user.email
            if serializer.is_valid(raise_exception=True):
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response({"OTP": ["The OTP you've entered is incorrect."]}, status=status.HTTP_400_BAD_REQUEST)
        return Response({}, status=status.HTTP_400_BAD_REQUEST)
