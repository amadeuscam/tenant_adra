from datetime import date, datetime

from django.test import TestCase, Client
from django.urls import reverse

from adra.templatetags.verbose_names import get_verbose_field_name
from adra.models import Persona, Hijo, Alimentos, AlmacenAlimentos, Profile
from adra.forms import PersonaForm, HijoForm
from django_tenants.test.client import TenantClient
from django_tenants.test.cases import TenantTestCase
from django.test import tag
from delegaciones.models import BeneficiariosGlobales


class TestBeneficariosGlobales(TenantTestCase):

    @classmethod
    def setup_tenant(cls, tenant):
        """
        Add any additional setting to the tenant before it get saved. This is required if you have
        required fields.
        """
        tenant.code = 1
        tenant.codigo_postal = 45200
        return tenant

    def setUp(self) -> None:
        pass

    def test_beneficario_global(self):
        bngl = BeneficiariosGlobales.objects.create(
            delegacion_name="adra torrejon",
            delegacion_code=1,
            documentacion_beneficiario="x00000000b",
            ciudad="Madrid",
            provincia="Madrid",
            telefono=0,
            nombre_beneficiario="jose maria"
        )
        self.assertEqual(bngl.__str__(), "jose maria")
