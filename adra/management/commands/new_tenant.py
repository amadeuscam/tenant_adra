from django.core.management.base import BaseCommand
from delegaciones.models import Delegaciones,Domain


class Command(BaseCommand):

    def handle(self, *args, **options):

        tenant = Delegaciones(
            schema_name='public',
            nombre='Adra General',
            code='0',
            codigo_postal=28850,
            ciudad='Madrid',
            provincia='Madrid',
            telegram_code='x0x',

        )
        tenant.save()

        domain = Domain()
        domain.domain = 'localhost'  # don't add your port or www here! on a local server you'll want to use localhost here
        domain.tenant = tenant
        domain.is_primary = True
        domain.save()
