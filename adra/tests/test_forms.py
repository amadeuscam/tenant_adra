from datetime import date, datetime

from django.test import TestCase, Client
from django.urls import reverse

from adra.templatetags.verbose_names import get_verbose_field_name
from adra.models import Persona, Hijo, Alimentos, AlmacenAlimentos, Profile
from adra.forms import PersonaForm, HijoForm
from django_tenants.test.client import TenantClient
from django_tenants.test.cases import TenantTestCase
from django.test import tag
import pytest


class TestForms(TenantTestCase):

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
        super().setUp()
        self.client = TenantClient(self.tenant)
        self.persona_form_dict = {
            "nombre_apellido": "lucian cati",
            "dni": "",
            "fecha_nacimiento": "1990-01-27",
            "numero_adra": 1,
            "nacionalidad": "rumana",
            "domicilio": "calle sin numero",
            "are_acte": True,
            "ciudad": "Torrejon",
            "telefono": 0,
            "mensaje": "alta nueva",
            "sexo": "mujer",
            "discapacidad": False,
            "empadronamiento": True,
            "libro_familia": True,
            "fotocopia_dni": True,
            "prestaciones": True,
            "nomnia": True,
            "cert_negativo": True,
            "aquiler_hipoteca": True,
            "recibos": True,
            "email": True,
            "covid": True,
            "codigo_postal": True,
            "otros_documentos": "",
            "active": True
        }
        self.hijo_form_dict = {
            "parentesco": "marido",
            "nombre_apellido": "maria fernandez",
            "dni": "",
            "otros_documentos": "",
            "fecha_nacimiento": "1990-01-27",
            "discapacidad": False,
            "sexo": "mujer"
        }

    def test_persona_form_empty_doc(self):
        form = PersonaForm(data=self.persona_form_dict)
        self.assertEqual(form.errors["otros_documentos"], ["Este campo es necesario"])
        self.assertEqual(form.errors["dni"], ["Este campo es necesario"])

    def test_persona_form_fill_doc(self):
        self.persona_form_dict.update({"otros_documentos": "tr6548211", "dni": "x00000000q"})
        form = PersonaForm(data=self.persona_form_dict)
        self.assertEqual(form.errors["otros_documentos"], ["Solo debe haber un campo para la identificación"])
        self.assertEqual(form.errors["dni"], ["Solo debe haber un campo para la identificación"])

    def test_hijo_form_empty_doc(self):
        form = HijoForm(data=self.hijo_form_dict)
        self.assertEqual(form.errors["otros_documentos"], ["Este campo es necesario"])
        self.assertEqual(form.errors["dni"], ["Este campo es necesario"])

    def test_hijo_form_fill_doc(self):
        self.hijo_form_dict.update({"otros_documentos": "tr6548211", "dni": "x00000000q"})
        form = HijoForm(data=self.hijo_form_dict)
        self.assertEqual(form.errors["otros_documentos"], ["Solo debe haber un campo para la identificación"])
        self.assertEqual(form.errors["dni"], ["Solo debe haber un campo para la identificación"])

    def test_signup_page_url(self):
        response = self.client.get("/accounts/signup/")
        self.assertEqual(response.status_code, 200)

    @pytest.mark.skip
    def test_signup_form(self):
        response = self.client.post('/accounts/signup/', data={
            'username': "maria",
            "first_name": "vasile",
            "last_name": "moza",
            'email': "a@test.es",
            'password1': "dsajkjdklajsdkljas",
            'password2': "dsajkjdklajsdkljas"
        })
        self.assertEqual(response.status_code, 302)
