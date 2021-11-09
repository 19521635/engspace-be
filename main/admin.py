from django.contrib import admin
from .models import Folder, Topic, Set, SetDetail
# Register your models here.


class SetDetailInline(admin.StackedInline):
    model = SetDetail
    can_delete = True


class SetAdmin(admin.ModelAdmin):
    list_display = ('name', 'description',
                    'date_created', 'date_updated', 'user')
    search_fields = ('id', 'name', 'user__username')
    ordering = ('id', 'date_created', 'date_updated')
    inlines = (SetDetailInline,)


class FolderAdmin(admin.ModelAdmin):
    list_display = ('name', 'description', 'date_created',
                    'date_updated', 'is_public')
    search_fields = ('id', 'name', 'description', 'user__username')
    ordering = ('id', 'date_created', 'date_updated')


class TopicAdmin(admin.ModelAdmin):
    list_display = ('name', 'description', 'date_created',
                    'date_updated', 'is_public')
    search_fields = ('id', 'name', 'description', 'user__username')
    ordering = ('id', 'date_created', 'date_updated')


admin.site.register(Topic, TopicAdmin)

admin.site.register(Folder, FolderAdmin)

admin.site.register(Set, SetAdmin)
