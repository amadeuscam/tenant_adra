import os

from django.contrib.auth.models import User
from django.db import connection, IntegrityError
from django.db.models.signals import post_delete, post_save
from django.dispatch import receiver
from django.shortcuts import get_object_or_404
from django_tenants.utils import get_tenant_model
from rest_framework.authtoken.models import Token

from delegaciones.models import BeneficiariosGlobales

from .models import Persona, Profile
from django.db.models import Q, Sum
from django_tenants.migration_executors.base import run_migrations
from django_tenants.signals import post_schema_sync, schema_migrated
from django_tenants.models import TenantMixin, DomainMixin
from django.contrib.auth import get_user_model
from django_tenants.utils import schema_context


@receiver(schema_migrated, sender=run_migrations)
def handle_schema_migrated(sender, **kwargs):
    # print("a" * 199)
    # print(kwargs)
    schema_name = kwargs['schema_name']
    # print(schema_name)
    with schema_context(schema_name):
        try:
            UserModel = get_user_model()
            UserModel.objects.create_superuser(
                username=os.environ.get("SUPERUSER_NAME"),
                password=os.environ.get("SUPERUSER_PASSWORD"),
                email=os.environ.get("SUPERUSER_EMAIL"),
                is_superuser=True
            )
        except IntegrityError:
            pass


@receiver(post_save, sender=User)
def create_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=Persona)
def create_beneficiarios_globales(sender, instance, created, **kwargs):
    if created:
        print(instance.nacionalidad)
        tenant_info = get_tenant_model().objects.get(
            schema_name=connection.get_schema()
        )
        print(tenant_info)
        BeneficiariosGlobales.objects.create(
            delegacion_name=tenant_info.oar,
            nombre_beneficiario=instance.nombre_apellido,
            documentacion_beneficiario=instance.dni
            if instance.dni
            else instance.otros_documentos,
            ciudad=tenant_info.ciudad,
            provincia=tenant_info.provincia,
            telefono=instance.telefono,
            delegacion_code=tenant_info.code,
        )
    else:
        # update user global
        tenant_info = get_tenant_model().objects.get(
            schema_name=connection.get_schema()
        )
        print(tenant_info)
        documentacion = instance.dni if instance.dni else instance.otros_documentos
        print(documentacion)
        logic = Q(
            documentacion_beneficiario=documentacion,
            telefono=instance.telefono,
            nombre_beneficiario=instance.nombre_apellido,
            _connector=Q.OR,
        )
        BeneficiariosGlobales.objects.filter(logic, delegacion_code=tenant_info.code).update(
            delegacion_name=tenant_info.oar,
            nombre_beneficiario=instance.nombre_apellido,
            documentacion_beneficiario=documentacion,
            ciudad=tenant_info.ciudad,
            provincia=tenant_info.provincia,
            telefono=instance.telefono,
            delegacion_code=tenant_info.code,
        )
        print("updated")
        print(instance)


@receiver(post_delete, sender=Persona)
def delete_beneficiarios_globales(sender, instance, **kwargs):
    print(instance.nombre_apellido)
    print(instance.telefono)
    print(instance.dni)
    print(instance.otros_documentos)
    ben = BeneficiariosGlobales.objects.get(
        nombre_beneficiario=instance.nombre_apellido,
        telefono=instance.telefono,
        documentacion_beneficiario=instance.dni
        if instance.dni
        else instance.otros_documentos,
    )
    ben.delete()


@receiver(post_save, sender=User)
def save_profile(sender, instance, **kwargs):
    instance.profile.save()


@receiver(post_save, sender=User)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        Token.objects.create(user=instance)
