from django.contrib import admin
from .models import Folder, Topic, Set, SetDetail
# Register your models here.
admin.site.register(Folder)
admin.site.register(Topic)


class SetDetailInline(admin.StackedInline):
    model = SetDetail
    can_delete = True


class SetAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'description',
                    'date_created', 'date_updated', 'user')
    search_fields = ('id', 'name', 'user__username')
    ordering = ('id', 'date_created', 'date_updated')
    inlines = (SetDetailInline,)


admin.site.register(Set, SetAdmin)
