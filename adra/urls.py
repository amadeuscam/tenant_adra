from django.urls import include, path
from rest_framework.routers import DefaultRouter
from rest_framework_simplejwt import views as jwt_views

from . import views
from .views import (AlmacenListView, HijoDeleteView, HijoUpdateView,
                    PersonaAlimentosDeleteView, PersonaAlimentosUpdateView,
                    PersonaCreateView, PersonaDeleteView, PersonaDetailView,
                    PersonaListView, PersonaUpdateView)

app_name = "adra"
# Create a router and register our viewsets with it.
router = DefaultRouter()
router.register(r"personas", views.PersonaViewSet)
router.register(r"almacen", views.AlmacenViewSet)
router.register(r"users", views.UserViewSet)

urlpatterns = [
    path("api/", include((router.urls, "api"), namespace="api")),
    path(
        "api/token/",
        jwt_views.TokenObtainPairView.as_view(),
        name="token_obtain_pair",
    ),
    path(
        "api/token/refresh/",
        jwt_views.TokenRefreshView.as_view(),
        name="token_refresh",
    ),
    # personas url
    path("", PersonaListView.as_view(), name="persona-home"),
    path(
        "persona/<int:pk>/",
        PersonaDetailView.as_view(),
        name="personas_detail",
    ),
    path("persona/new/", PersonaCreateView.as_view(), name="persona-create"),
    path(
        "persona/<int:pk>/update/",
        PersonaUpdateView.as_view(),
        name="persona-update",
    ),
    path(
        "persona/<int:pk>/delete/",
        PersonaDeleteView.as_view(),
        name="persona-delete",
    ),
    # end persona url
    # almacen url
    path("almacen/", AlmacenListView.as_view(), name="almacen-home"),
    path("almacen/<int:pk>/update/", views.AlmacenUpdateView.as_view(), name="almacen-update"),
    # end almacen url
    # statistics
    path("statistics/", views.statistics_persona, name="statistics-personas"),
    path("telegram/", views.telegram_messages, name="telegram_message_view"),
    path("export/csv/", views.export_users_csv, name="exportar-users-csv"),
    path("export/pdf/<int:pk><str:mode>", views.generar_hoja_entrega, name="pdf_form"),
    path("export/hoja-entrega-global", views.generar_hoja_entrega_global, name="hoja_entrega_global"),
    path("export/valoracion-social", views.valoracion_social_global, name="valoracion_social"),
    path(
        "export/docx/<int:pk>",
        views.generar_hoja_valoracion_social,
        name="docx_form",
    ),
    # end statistics
    # buscar url
    path("buscar/", views.buscar, name="buscar"),
    path("buscar-alimentos-por-fecha/", views.buscar_fecha, name="buscar-por-fecha"),
    # end bucar url
    # alimentos url
    path(
        "persona/<int:pk>/alimentos",
        views.adauga_alimentos_persona,
        name="alimentos-create",
    ),
    path(
        "persona/alimentos/<int:pk>/update",
        PersonaAlimentosUpdateView.as_view(),
        name="persona-update-alimentos",
    ),
    path(
        "persona/alimentos/<int:pk>/delete",
        PersonaAlimentosDeleteView.as_view(),
        name="persona-alimentos-delete",
    ),
    # end alimentos url
    # hijos url
    path(
        "persona/<int:pk>/hijos", views.anadir_familiar, name="hijo-create"
    ),
    path(
        "persona/hijos/<int:pk>/update",
        HijoUpdateView.as_view(),
        name="hijo-update",
    ),
    path(
        "persona/hijos/<int:pk>/delete",
        HijoDeleteView.as_view(),
        name="hijo-delete",
    ),
    # end hijos url
    path("edit/", views.edit, name="edit-profile"),
    path("get-data/", views.get_data, name="get_data"),
    # path(
    #     "get-beneficiarios-activos/<int:number>",
    #     views.get_beneficiarios_activos,
    #     name="get_beneficiarios_activos",
    # ),
    path("configuracion/", views.configuracion, name="configuracion"),
    path("dashboard/", views.dashboard, name="dashboard"),
]
