from django.urls import path
from django.urls.conf import include

urlpatterns = [
    path("accounts/", include("admin.accounts.urls")),
    path("folders/", include("admin.folders.urls")),
    path("topics/", include("admin.topics.urls"))
]
