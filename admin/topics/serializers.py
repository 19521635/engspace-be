from django.db.models import fields
from rest_framework import serializers
from main.models import Topic


class TopicAdminSerializer(serializers.ModelSerializer):
    class Meta:
        model = Topic
        fields = "__all__"
