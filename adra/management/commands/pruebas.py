from django.core.management.base import BaseCommand
from django.db.models import Count

from adra.models import Persona
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

                print(tenant.nombre)
                dups = (
                    Persona.objects.values('telefono')
                    .annotate(count=Count('id'))
                    .values('telefono')
                    .order_by()
                    .filter(count__gt=1)

                )
                # print( Persona.objects.filter(dni="Xxxxxxx"))
                count = 63
                for per in Persona.objects.filter(telefono__in=[10057,10056]):
                    count += 1
                    per.telefono = count
                    per.save()
                Persona.objects.filter(telefono=655325445).update(telefono=33)
                Persona.objects.filter(telefono=654209095).update(telefono=330)
                Persona.objects.filter(telefono=602146389).update(telefono=330)

                print(dups)
