from django.contrib.auth import get_user_model
from django.db import models
from django_tenants.models import DomainMixin, TenantMixin


class Delegaciones(TenantMixin):
    nombre = models.CharField(max_length=255)
    oar = models.CharField(max_length=500)
    code = models.IntegerField()
    codigo_postal = models.IntegerField(default=None)
    ciudad = models.CharField(max_length=254)
    calle = models.CharField(max_length=254, blank=True)
    provincia = models.CharField(max_length=255, blank=True)
    telegram_code = models.CharField(max_length=500, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    auto_create_schema = True

    def __str__(self):
        return self.nombre


class Domain(DomainMixin):
    pass


class BeneficiariosGlobales(models.Model):
    delegacion_name = models.CharField(max_length=350)
    nombre_beneficiario = models.CharField(max_length=250)
    documentacion_beneficiario = models.CharField(max_length=250)
    ciudad = models.CharField(max_length=256)
    provincia = models.CharField(max_length=256)
    telefono = models.IntegerField()
    delegacion_code = models.IntegerField(blank=True,null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.nombre_beneficiario

