import csv
import os

import pandas as pd
from django.conf import settings
from django.contrib.auth.models import User
from django.core.management.base import BaseCommand
from django_tenants.utils import get_tenant_model, tenant_context

from adra.models import Hijo, Persona


class Command(BaseCommand):

    def handle(self, *args, **options):
        for tenant in get_tenant_model().objects.exclude(schema_name="public"):
            with tenant_context(tenant):
                if tenant.code == 2:
                     Persona.objects.all().delete()
      