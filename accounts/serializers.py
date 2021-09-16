from django.views.decorators.csrf import requires_csrf_token
from rest_framework import serializers
from rest_framework.validators import UniqueValidator
from .models import User


class UserSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(required=True, validators=[
                                   UniqueValidator(queryset=User.objects.all())])
    username = serializers.CharField(required=True, validators=[
                                     UniqueValidator(queryset=User.objects.all())])
    password = serializers.CharField(min_length=8, write_only=True)

    class Meta:
        model = User
        fields = ('id', 'email', 'username', 'password',
                  'first_name', 'last_name', 'is_staff')
        extra_kwargs = {'password': {'write_only': True},
                        'is_staff': {'read_only': True},
                        'id': {'read_only': True},
                        'first_name': {'required': True},
                        'last_name': {'required': True}, }

    def create(self, validated_data):
        password = validated_data.pop('password', None)
        instance = self.Meta.model(**validated_data)
        if password is not None:
            instance.set_password(password)
        instance.save()
        return instance
