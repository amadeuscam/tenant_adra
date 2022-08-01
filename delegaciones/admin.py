from django.contrib import admin
from .models import Domain, Delegaciones, BeneficiariosGlobales
from django_tenants.admin import TenantAdminMixin
from django_tenants.utils import get_public_schema_name
from django.apps import apps


class DomainInline(admin.TabularInline):
    model = Domain
    max_num = 1


class TenantsAdmin(TenantAdminMixin, admin.ModelAdmin):
    '''
    Hides public models from tenants
    '''

    def has_view_permission(self, request, view=None):
        if request.tenant.schema_name == get_public_schema_name():
            return True
        else:
            return False

    def has_add_permission(self, request, view=None):
        if request.tenant.schema_name == get_public_schema_name():
            return True
        else:
            return False

    def has_change_permission(self, request, view=None):
        if request.tenant.schema_name == get_public_schema_name():
            return True
        else:
            return False

    def has_delete_permission(self, request, view=None):
        if request.tenant.schema_name == get_public_schema_name():
            return True
        else:
            return False

    def has_view_or_change_permission(self, request, view=None):
        if request.tenant.schema_name == get_public_schema_name():
            return True
        else:
            return False


# delegacion_name = tenant_info.nombre,
# nombre_beneficiario = instance.nombre_apellido,
# documentacion_beneficiario = instance.dni if instance.dni else instance.otros_documentos,
# ciudad = tenant_info.ciudad,
# provincia = tenant_info.provincia,
# telefono = instance.telefono,
# delegacion_code = tenant_info.code


class BeneficiariosGlobalesAdmin(TenantsAdmin):
    list_display = (
        "nombre_beneficiario",
        "delegacion_name",
        "documentacion_beneficiario",
        "ciudad",
        "provincia",
        "telefono",
    )
    search_fields = (
        "nombre_beneficiario",
        "delegacion_name",
    )
    list_filter = (
        "delegacion_name",
        "ciudad",
        "provincia"
    )
    list_per_page = 15


class DelegacionesAdmin(TenantsAdmin):
    inlines = [DomainInline]


admin.site.register(BeneficiariosGlobales, BeneficiariosGlobalesAdmin)
admin.site.register(Delegaciones, DelegacionesAdmin)
