
from django.core.management.base import BaseCommand
from django_tenants.utils import get_tenant_model, tenant_context

from adra.models import Hijo


class Command(BaseCommand):
    def handle(self, *args, **options):
        for tenant in get_tenant_model().objects.exclude(schema_name="public"):
            with tenant_context(tenant):
                Hijo.objects.filter(sexo="m").update(sexo="mujer")
                Hijo.objects.filter(sexo="h").update(sexo="hombre")
