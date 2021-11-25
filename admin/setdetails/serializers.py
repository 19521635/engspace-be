from rest_framework import serializers
from main.models import SetDetail


class SetDetailListAdminSerializer(serializers.ModelSerializer):
    class Meta:
        model = SetDetail
        fields = '__all__'
        extra_kwargs = {'image': {'read_only': True}}
