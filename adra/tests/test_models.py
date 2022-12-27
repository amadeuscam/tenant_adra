from datetime import date
import pytest
from django.contrib.auth.models import User
from django_tenants.test.cases import TenantTestCase
from adra.models import Persona, Hijo, AlmacenAlimentos


class TestAppModels(TenantTestCase):
    def calculate_age(self, birth_date):
        today = date.today()
        return (today.year - birth_date.year - ((today.month, today.day) < (birth_date.month, birth_date.day)))

    @pytest.fixture(autouse=True)
    def use_benefiario_fixture(self, familiares, alimentos, almacen_alimentos, beneficario):
        self.familiar = familiares
        self.alimentos = alimentos
        self.almacen_alimentos = almacen_alimentos
        self.beneficario = beneficario

    @classmethod
    def setup_tenant(cls, tenant):
        """
        Add any additional setting to the tenant before it get saved. This is required if you have
        required fields.
        """
        tenant.code = 1
        tenant.codigo_postal = 28200
        return tenant

    def test_beneficario(self):
        beneficario = self.beneficario.create(id=1)
        self.familiar.create()
        assert beneficario.__str__() == "Maria Fernandez"
        assert int(beneficario.age) == self.calculate_age(date(1990, 0o1, 27))
        assert beneficario.numero_beneficiarios == 2
        assert beneficario.get_babys_number() == 1
        assert isinstance(beneficario, Persona)
        assert "/persona/1/" == beneficario.get_absolute_url()

    def test_familiares(self):
        self.beneficario.create(id=1)
        familiar = self.familiar()
        assert familiar.__str__() == "Mercedes Fernandez"
        assert int(familiar.age) == self.calculate_age(date(2020, 0o1, 27))
        assert isinstance(familiar, Hijo)
        assert "/persona/1/" == familiar.get_absolute_url()

    def test_alimentos(self):
        alimentos = self.alimentos.create()
        assert "/persona/1/" == alimentos.get_absolute_url()

    def test_almacen_alimentos(self):
        almacen_alimentos = self.almacen_alimentos.create()
        assert "/almacen/" == almacen_alimentos.get_absolute_url()
        alimento_nombre, dias_hasta_caducidad = AlmacenAlimentos.caducidad(AlmacenAlimentos, number=2)
        assert alimento_nombre == 'Alubia Cocida'
        assert dias_hasta_caducidad == dias_hasta_caducidad

    def test_profile(self):
        self.user = User.objects.get(id=1)
        assert self.user.profile.__str__() == "Profile for user lucian"
