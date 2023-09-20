from datetime import date

import pytest
from django.contrib.auth.models import User
from django_tenants.test.cases import TenantTestCase

import tests.factories
from adra.models import AlmacenAlimentos, Hijo, Persona
from faker import Faker

import conftest

faker = Faker()

class TestAppModels(TenantTestCase):
    def calculate_age(self, birth_date):
        today = date.today()
        return (
            today.year
            - birth_date.year
            - ((today.month, today.day) < (birth_date.month, birth_date.day))
        )

    @pytest.fixture(autouse=True)
    def use_benefiario_fixture(
        self,
        familiar_factory,
        alimentos_factory,
        almacen_alimentos_factory,
        persona_factory,
    ):
        self.familiar_factory = familiar_factory
        self.alimentos_factory = alimentos_factory
        self.almacen_alimentos_factory = almacen_alimentos_factory
        self.persona_factory = persona_factory

    @classmethod
    def setup_tenant(cls, tenant):
        """
        Add any additional setting to the tenant before it get saved. This is required if you have
        required fields.
        """
        tenant.code = 1
        tenant.codigo_postal = 28200
        return tenant

    def setUp(self) -> None:
        super().setUp()

        self.beneficario = self.persona_factory.create(id=1)
        self.familiar = self.familiar_factory.create(id=1)
        self.almacen_alimentos = self.almacen_alimentos_factory.create(id=1)
        self.alimentos = self.alimentos_factory.create()

    def test_beneficario(self):
        self.familiar_factory.create(
            id=faker.random_int(),
            fecha_nacimiento=f"2023-01-01",
            nombre_apellido=faker.name(),
        )
        assert int(self.beneficario.age) == self.calculate_age(
            date(1990, 0o1, 27)
        )
        assert self.beneficario.numero_beneficiarios == 3
        assert self.beneficario.get_babys_number() == 1
        assert isinstance(self.beneficario, Persona)
        assert "/persona/1/" == self.beneficario.get_absolute_url()

    def test_familiares(self):
        fam_json = tests.factories.generate_dict_factory(self.familiar_factory)()
        assert self.familiar.__str__() == fam_json["nombre_apellido"]
        assert int(self.familiar.age) == self.calculate_age(date(2018, 0o1, 27))
        assert isinstance(self.familiar, Hijo)
        assert "/persona/1/" == self.familiar.get_absolute_url()

    def test_alimentos(self):
        assert "/persona/1/" == self.alimentos.get_absolute_url()

    def test_almacen_alimentos(self):
        assert "/almacen/" == self.almacen_alimentos.get_absolute_url()
        alimento_nombre, dias_hasta_caducidad = AlmacenAlimentos.caducidad(
            AlmacenAlimentos, number=2
        )
        assert alimento_nombre == "Garbanzos Cocidos"
        assert dias_hasta_caducidad == dias_hasta_caducidad

    def test_profile(self):
        self.user = User.objects.get(id=1)
        assert self.user.profile.__str__() == "Profile for user lucian"
