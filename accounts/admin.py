from django.contrib import admin
from accounts.models import User, UserProfile
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
# Register your models here.


class UserProfileAdmin(admin.ModelAdmin):
    model = UserProfile
    list_display = ('id', 'get_username', 'get_email',
                    'get_first_name', 'get_last_name', 'get_is_staff')
    search_fields = ('id', 'username', 'email')
    list_filter = ['user__is_staff']
    ordering = ['id']

    @admin.display(description='Username', ordering='user__username')
    def get_username(self, obj):
        return obj.user.username

    @admin.display(description='Email', ordering='user__email')
    def get_email(self, obj):
        return obj.user.email

    @admin.display(description='Firstname', ordering='user__first_name')
    def get_first_name(self, obj):
        return obj.user.first_name

    @admin.display(description='Lastname', ordering='user__last_name')
    def get_last_name(self, obj):
        return obj.user.last_name

    @admin.display(description='Staff status', ordering='user__is_staff')
    def get_is_staff(self, obj):
        return obj.user.is_staff


class UserAdmin(BaseUserAdmin):
    pass


admin.site.register(User, UserAdmin)
admin.site.register(UserProfile, UserProfileAdmin)
