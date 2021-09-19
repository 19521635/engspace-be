from rest_framework import serializers
from rest_framework.validators import UniqueValidator
from .models import User, UserProfile


class UserSignUpSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(required=True, validators=[
                                   UniqueValidator(queryset=User.objects.all())])
    username = serializers.CharField(required=True, validators=[
                                     UniqueValidator(queryset=User.objects.all())])
    password = serializers.CharField(min_length=8, write_only=True)

    class Meta:
        model = User
        fields = ('email', 'username', 'password',
                  'first_name', 'last_name')
        extra_kwargs = {'password': {'write_only': True}, }

    def create(self, validated_data):
        password = validated_data.pop('password', None)
        instance = self.Meta.model(**validated_data)
        if password is not None:
            instance.set_password(password)
        instance.save()
        return instance


class UserProfileSerializer(serializers.ModelSerializer):
    dob = serializers.DateField(
        source='profile.dob', required=False)
    website = serializers.URLField(
        source='profile.website', allow_blank=True, allow_null=True, required=False)
    bio = serializers.CharField(
        source='profile.bio', allow_blank=True, allow_null=True, required=False)
    fb_url = serializers.URLField(
        source='profile.fb_url', allow_blank=True, allow_null=True, required=False)
    avatar = serializers.ImageField(source='profile.avatar', required=False)
    following = serializers.SlugRelatedField(
        many=True, slug_field='following_user_id', read_only=True)
    followers = serializers.SlugRelatedField(
        many=True, slug_field='user_id', read_only=True)

    class Meta:
        model = User
        fields = ('username', 'email', 'first_name', 'last_name',
                  'dob', 'website', 'bio', 'fb_url', 'avatar', 'followers', 'following')

    def update(self, instance, validated_data):
        profile_data = validated_data.pop('profile', None)
        UserProfile.objects.update_or_create(
            user=instance, defaults=profile_data)
        return super(UserProfileSerializer, self).update(instance, validated_data)


class UserStatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('is_active', 'is_staff')


class UserFollowingSerializer(serializers.ModelSerializer):
    following = serializers.SlugRelatedField(
        many=True, slug_field='following_user_id', read_only=True)
    followers = serializers.SlugRelatedField(
        many=True, slug_field='user_id', read_only=True)

    class Meta:
        model = User
        fields = ('followers', 'following')
