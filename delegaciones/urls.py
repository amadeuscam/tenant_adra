from django.urls import include, path

from . import views

urlpatterns = [

]
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include, path

from . import views

app_name = "delegacion"
urlpatterns = [
    # Django admin
    path('toate-dar-admin/', admin.site.urls),

    # User management
    path('accounts/', include('allauth.urls')),
    # local apps
    path('', views.home, name="public_home"),
    path('oar-info/', views.get_oar_info, name="oar-info"),

]
