import pytest
from django_tenants.test.cases import TenantTestCase
from django_tenants.test.client import TenantClient
from adra.forms import PersonaForm, HijoForm


class TestForms(TenantTestCase):
    @pytest.fixture(autouse=True)
    def use_fixtures(self, familiar_json, ben_json):
        self.bnf = ben_json
        self.fam_json = familiar_json

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

    def test_persona_form_empty_doc(self):
        self.bnf.update(
            {
                "nombre_apellido": "soto maria",
                "telefono": 1,
                "numero_adra": 2,
                "dni": "",
            }
        )

        form = PersonaForm(data=self.bnf)
        self.assertEqual(
            form.errors["otros_documentos"], ["Este campo es necesario"]
        )
        self.assertEqual(form.errors["dni"], ["Este campo es necesario"])
        self.assertFalse(form.is_valid())

    def test_persona_form_fill_doc(self):
        self.bnf.update(
            {
                "nombre_apellido": "hop maria",
                "telefono": 2,
                "numero_adra": 3,
                "otros_documentos": "tr6548211",
                "dni": "x00000000q",
            }
        )
        form = PersonaForm(data=self.bnf)

        self.assertEqual(
            form.errors["otros_documentos"],
            ["Solo debe haber un campo para la identificación"],
        )
        self.assertEqual(
            form.errors["dni"],
            ["Solo debe haber un campo para la identificación"],
        )
        self.assertFalse(form.is_valid())

    def test_familiar_form_empty_document_id(self):

        del self.fam_json["persona"]
        self.fam_json.update({"otros_documentos": "", "dni": ""})
        form = HijoForm(data=self.fam_json)
        self.assertEqual(
            form.errors["otros_documentos"], ["Este campo es necesario"]
        )
        self.assertEqual(form.errors["dni"], ["Este campo es necesario"])
        self.assertFalse(form.is_valid())

    def test_familiar_form_fill_document_id(self):
        self.fam_json.update(
            {"otros_documentos": "tr6548211", "dni": "x00000000q"}
        )
        form = HijoForm(data=self.fam_json)
        self.assertEqual(
            form.errors["otros_documentos"],
            ["Solo debe haber un campo para la identificación"],
        )
        self.assertEqual(
            form.errors["dni"],
            ["Solo debe haber un campo para la identificación"],
        )

    def test_signup_page_url(self):
        response = self.client.get("/accounts/signup/")
        self.assertEqual(response.status_code, 200)

    @pytest.mark.skip
    def test_signup_form(self):
        response = self.client.post(
            "/accounts/signup/",
            data={
                "username": "maria",
                "first_name": "vasile",
                "last_name": "moza",
                "email": "a@test.es",
                "password1": "dsajkjdklajsdkljas",
                "password2": "dsajkjdklajsdkljas",
            },
        )
        self.assertEqual(response.status_code, 302)
