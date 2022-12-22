from datetime import date

from django.contrib.auth import get_user_model
from django.test import TestCase
from django.urls import reverse
from django.contrib.auth.models import User
from adra.models import Persona, Hijo, Alimentos, AlmacenAlimentos, Profile
from delegaciones.models import Delegaciones
import pytest

from django_tenants.test.cases import TenantTestCase


class TestAppModels(TenantTestCase):
    def calculate_age(self, birth_date):
        today = date.today()
        return (today.year - birth_date.year - ((today.month, today.day) < (birth_date.month, birth_date.day)))

    @classmethod
    def setup_tenant(cls, tenant):
        """
        Add any additional setting to the tenant before it get saved. This is required if you have
        required fields.
        """
        tenant.code = 1
        tenant.codigo_postal = 28200
        return tenant

    def setUp(self):
        self.beneficario = Persona.objects.create(
            nombre_apellido="Maria Guapa",
            dni="x00000000q",
            otros_documentos="",
            fecha_nacimiento=date(1990, 0o1, 27),
            numero_adra=1,
            nacionalidad="española",
            domicilio="calle sin numero",
            are_acte=True,
            ciudad="Madrid",
            telefono="312570235",
            modificado_por_id=1,
            mensaje="alta nueva",
            active=True,
            sexo="mujer",
            discapacidad=False,
            aquiler_hipoteca=True,
            cert_negativo=True,
            empadronamiento=True,
            fotocopia_dni=True,
            libro_familia=True,
            nomnia=True,
            prestaciones=True,
            recibos=True,
            email="a@test.es",
            covid=False,
            codigo_postal=28850,
        )
        self.familiar = Hijo.objects.create(
            nombre_apellido="Mercedes Fernandez",
            parentesco="hija",
            dni="x00000000w",
            otros_documentos="",
            fecha_nacimiento=date(2020, 0o1, 27),
            active=True,
            discapacidad=False,
            sexo="mujer",
            persona=self.beneficario
        )

        self.alimentos = Alimentos.objects.create(
            alimento_1=2,
            alimento_2=2,
            alimento_3=2,
            alimento_4=2,
            alimento_5=2,
            alimento_6=2,
            alimento_7=2,
            alimento_8=2,
            alimento_9=2,
            alimento_10=2,
            alimento_11=2,
            alimento_12=2,
            alimento_13=2,
            fecha_recogida=date(2020, 0o1, 27),
            persona_id=self.beneficario.id
        )
        self.almacen_alimentos = AlmacenAlimentos.objects.create(
            alimento_1=2,
            alimento_2=2,
            alimento_3=2,
            alimento_4=2,
            alimento_5=2,
            alimento_6=2,
            alimento_7=2,
            alimento_8=2,
            alimento_9=2,
            alimento_10=2,
            alimento_11=2,
            alimento_12=2,
            alimento_13=2,
            alimento_1_caducidad=date(2020, 0o1, 27),
            alimento_2_caducidad=date(2022, 0o1, 27),
            alimento_3_caducidad=date(2020, 0o1, 27),
            alimento_4_caducidad=date(2020, 0o1, 27),
            alimento_5_caducidad=date(2020, 0o1, 27),
            alimento_6_caducidad=date(2020, 0o1, 27),
            alimento_7_caducidad=date(2020, 0o1, 27),
            alimento_8_caducidad=date(2020, 0o1, 27),
            alimento_9_caducidad=date(2020, 0o1, 27),
            alimento_10_caducidad=date(2020, 0o1, 27),
            alimento_11_caducidad=date(2020, 0o1, 27),
            alimento_12_caducidad=date(2020, 0o1, 27),
            alimento_13_caducidad=date(2020, 0o1, 27),
        )
        self.user = User.objects.get(id=1)

    def test_persona(self):
        self.assertEqual(self.beneficario.__str__(), "Maria Guapa")
        self.assertEqual(int(self.beneficario.age), self.calculate_age(date(1990, 0o1, 27)))
        self.assertEqual(self.beneficario.numero_beneficiarios, 2)
        self.assertEqual(self.beneficario.get_babys_number(), 1)
        self.assertTrue(isinstance(self.beneficario, Persona))
        self.assertEqual("/persona/4/", self.beneficario.get_absolute_url())

    def test_familiares(self):
        self.assertEqual(self.familiar.__str__(), "Mercedes Fernandez")
        self.assertEqual(int(self.familiar.age), self.calculate_age(date(2020, 0o1, 27)))
        self.assertTrue(isinstance(self.familiar, Hijo))
        self.assertEqual("/persona/3/", self.familiar.get_absolute_url())

    def test_alimentos(self):
        self.assertEqual("/persona/1/", self.alimentos.get_absolute_url())

    def test_almacen_alimentos(self):
        self.assertEqual("/almacen/", self.almacen_alimentos.get_absolute_url())
        alimento_nombre, dias_hasta_caducidad = AlmacenAlimentos.caducidad(AlmacenAlimentos, number=2)
        self.assertEqual(alimento_nombre, 'Alubia Cocida')
        self.assertEqual(dias_hasta_caducidad, dias_hasta_caducidad)

    def test_profile(self):
        self.assertEqual(self.user.profile.__str__(), "Profile for user lucian")
