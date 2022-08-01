from django.db.models.signals import post_save
from django.contrib.auth.models import User
from django.dispatch import receiver
from .models import Profile, Persona
from rest_framework.authtoken.models import Token
from delegaciones.models import BeneficiariosGlobales
from django_tenants.utils import get_tenant_model
from django.db import connection


@receiver(post_save, sender=User)
def create_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=Persona)
def create_beneficiarios_globales(sender, instance, created, **kwargs):
    if created:
        print(instance.nacionalidad)
        tenant_info = get_tenant_model().objects.get(schema_name=connection.get_schema())
        print(tenant_info)
        BeneficiariosGlobales.objects.create(
            delegacion_name=tenant_info.nombre,
            nombre_beneficiario=instance.nombre_apellido,
            documentacion_beneficiario=instance.dni if instance.dni else instance.otros_documentos,
            ciudad=tenant_info.ciudad,
            provincia=tenant_info.provincia,
            telefono=instance.telefono,
            delegacion_code=tenant_info.code

        )


@receiver(post_save, sender=User)
def save_profile(sender, instance, **kwargs):
    instance.profile.save()


@receiver(post_save, sender=User)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        Token.objects.create(user=instance)
