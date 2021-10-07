from django.db.models import fields
from rest_framework import serializers
from main.models import Set, SetDetail


class SetDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = SetDetail
        fields = '__all__'


class SetAdminSerializer(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source='user.id')
    set_detail = SetDetailSerializer(read_only=True, many=True)

    class Meta:
        model = Set
        fields = ('id', 'is_public', 'name', 'description', 'date_created',
                  'date_updated', 'user', 'topic', 'set_detail')
