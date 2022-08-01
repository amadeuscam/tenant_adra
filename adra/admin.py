from django.conf import settings
from django.contrib import admin

from .models import Alimentos, AlmacenAlimentos, Hijo, Persona, Profile


@admin.register(Profile)
class ProfileAdmin(admin.ModelAdmin):
    list_display = ["user", "date_of_birth"]


class HijoInline(admin.TabularInline):
    model = Hijo


@admin.register(Hijo)
class HijoAdmin(admin.ModelAdmin):
    search_fields = ("nombre_apellido",)
    list_display = (
        "nombre_apellido",
        "persona",
        "modificado_por",
    )
    list_per_page = 15


@admin.action(description="Desactivar beneficiarios")
def make_published(modeladmin, request, queryset):
    queryset.update(active=False)


class PersonaAdmin(admin.ModelAdmin):
    inlines = [HijoInline]
    list_filter = (
        "categoria",
        "covid",
        "active"
    )
    search_fields = (
        "nombre_apellido",
        "numero_adra",
    )
    list_display = (
        "nombre_apellido",
        "numero_adra",
        "mensaje",
        "covid",
        "active"
    )
    list_display_links = (
        "numero_adra",
        "nombre_apellido",
    )
    list_editable = ("covid",)
    list_per_page = 15
    sortable_by = ("numero_adra",)
    ordering = ("nombre_apellido", "numero_adra")
    actions = [make_published]


class AlimentosAdmin(admin.ModelAdmin):
    list_display = (
        "fecha_recogida",
        "persona",
    )
    list_per_page = 15


# class DelegacionesAdmin(admin.ModelAdmin):
#     # readonly_fields = ('domain_url',)
#     pass


admin.site.register(Persona, PersonaAdmin)
# print(get_tenant_model().objects.get(schema_name='public'))
# admin.site.register(Hijo)

admin.site.register(Alimentos, AlimentosAdmin)
admin.site.register(AlmacenAlimentos)
# custom names admin site
# admin.site.index_title = settings.PLATFORM_NAME
# admin.site.site_header = f"Administración {settings.PLATFORM_NAME} "
# admin.site.site_title = "Adra"
