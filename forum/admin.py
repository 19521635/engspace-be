from django.contrib import admin
from .models import *

# Register your models here.


class PostAdmin(admin.ModelAdmin):
    list_display = ('name', 'user',
                    'date_created', 'date_updated', 'view_count', 'is_public')
    search_fields = ('id', 'name', 'user__username')
    ordering = ('id', 'is_public', 'date_created', 'date_updated')


class CommentAdmin(admin.ModelAdmin):
    list_display = ('user', 'post', 'parent',
                    'date_created', 'date_updated')
    search_fields = ('body', 'user__username', 'post__name', 'parent__id')
    ordering = ('id', 'date_created', 'date_updated')


admin.site.register(Post, PostAdmin)
admin.site.register(Comment, CommentAdmin)
