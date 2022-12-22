import functools
import io
from datetime import date, datetime

from django.conf import settings
from django.contrib.auth.models import User
from django.core.files import File
from django.test import TestCase, Client, RequestFactory
from django.urls import reverse

from adra.templatetags.verbose_names import get_verbose_field_name
from adra.models import Persona, Hijo, Alimentos, AlmacenAlimentos, Profile
from adra.forms import PersonaForm, HijoForm
from django_tenants.test.client import TenantClient
from django_tenants.test.cases import TenantTestCase
from django.test import tag

from adra.views import PersonaListView, PersonaDetailView
from delegaciones.models import BeneficiariosGlobales


class TestViews(TenantTestCase):

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
        self.client.login(username='lucian', password='masina')
        # self.user = User.objects.get(id=1)

        self.beneficario = Persona.objects.create(
            pk=1,
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

        self.almacen_alimentos = AlmacenAlimentos.objects.create(
            pk=1,
            alimento_1=100,
            alimento_2=100,
            alimento_3=100,
            alimento_4=100,
            alimento_5=100,
            alimento_6=100,
            alimento_7=100,
            alimento_8=100,
            alimento_9=100,
            alimento_10=100,
            alimento_11=100,
            alimento_12=100,
            alimento_13=100,
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
            fecha_recogida='2022-11-17',
            persona=self.beneficario,
        )

    def test_edit_profile_get(self):
        response = self.client.get(reverse('adra:edit-profile'))
        self.assertEqual(response.status_code, 200)

    def test_edit_profile_post(self):
        response_valid = self.client.post(reverse('adra:edit-profile'), data={
            "sexo": "mujer",
            "first_names": "vasile",
            "last_name": "moza",
            "date_of_birth": "1990-01-27",
            "email": "a@test.es"
        }, follow=True)
        self.assertEqual(response_valid.status_code, 200)
        response_invalid = self.client.post(reverse('adra:edit-profile'), data={})
        self.assertEqual(response_invalid.status_code, 200)

    def test_persona_detilview(self):
        response = self.client.get(reverse('adra:personas_detail', kwargs={"pk": self.beneficario.pk}))
        assert "filter" in response.context_data.keys()

    def test_persona_list_view(self):
        response = self.client.get(reverse('adra:persona-home'))
        assert response.context_data["nbar"] == "home"
        assert response.context_data["debug"] == settings.DEBUG
        assert response.context_data["platform_name"] == settings.PLATFORM_NAME

    def test_persona_create_view_with_globals(self):
        BeneficiariosGlobales.objects.create(
            delegacion_name="adra torrejon",
            delegacion_code=1,
            documentacion_beneficiario="x8731368q",
            ciudad="Madrid",
            provincia="Madrid",
            telefono=663020615,
            nombre_beneficiario="sdasW32dasdas"
        )
        response = self.client.post(reverse('adra:persona-create'),
                                    data={'nombre_apellido': 'sdasW32dasdas', 'dni': 'x00000000q',
                                          'fecha_nacimiento': date(2022, 12, 13), 'numero_adra': 423,
                                          'nacionalidad': 'Rumana', 'domicilio': 'dsa', 'are_acte': False,
                                          'ciudad': 'Torrejon De Ardoz', 'telefono': 663020615, 'mensaje': 'dasdas',
                                          'sexo': 'hombre', 'discapacidad': False, 'empadronamiento': True,
                                          'libro_familia': False, 'fotocopia_dni': True, 'prestaciones': True,
                                          'nomnia': True, 'cert_negativo': True, 'aquiler_hipoteca': True,
                                          'recibos': True, 'email': 'Gabri_28@yahoo.es', 'covid': False,
                                          'codigo_postal': 28850, 'otros_documentos': '', 'active': True}
                                    )

        assert response.status_code == 200

    def test_persona_create_view(self):
        response = self.client.post(reverse('adra:persona-create'),
                                    data={'nombre_apellido': 'sdasW32dasdas', 'dni': 'x8731368q',
                                          'fecha_nacimiento': date(2022, 12, 13), 'numero_adra': 423,
                                          'nacionalidad': 'Rumana', 'domicilio': 'dsa', 'are_acte': False,
                                          'ciudad': 'Torrejon De Ardoz', 'telefono': 663020615, 'mensaje': 'dasdas',
                                          'sexo': 'hombre', 'discapacidad': False, 'empadronamiento': True,
                                          'libro_familia': False, 'fotocopia_dni': True, 'prestaciones': True,
                                          'nomnia': True, 'cert_negativo': True, 'aquiler_hipoteca': True,
                                          'recibos': True, 'email': 'Gabri_28@yahoo.es', 'covid': False,
                                          'codigo_postal': 28850, 'otros_documentos': '', 'active': True}
                                    , follow=True)

        # print(response)
        assert response.status_code == 200

    def test_persona_create_view_get(self):
        Persona.objects.all().delete()
        response = self.client.get(reverse('adra:persona-create'))
        assert response.context_data["bas"] is None

    def test_persona_update_view(self):
        beneficario = Persona.objects.all()[0]
        response = self.client.post(reverse('adra:persona-update', kwargs={"pk": self.beneficario.pk}),
                                    data={'nombre_apellido': 'Maria Guapa', 'dni': 'x00000000q',
                                          'fecha_nacimiento': date(1990, 0o1, 27), 'numero_adra': 1,
                                          'nacionalidad': 'Rumana', 'domicilio': 'dsa', 'are_acte': False,
                                          'ciudad': 'Torrejon De Ardoz', 'telefono': 312570235, 'mensaje': 'dasdas',
                                          'sexo': 'hombre', 'discapacidad': False, 'empadronamiento': True,
                                          'libro_familia': False, 'fotocopia_dni': True, 'prestaciones': True,
                                          'nomnia': True, 'cert_negativo': True, 'aquiler_hipoteca': True,
                                          'recibos': True, 'email': 'Gabri_28@yahoo.es', 'covid': False,
                                          'codigo_postal': 28850, 'otros_documentos': '', 'active': True}, follow=True)
        assert response.status_code == 200

    def test_persona_update_view_context(self):
        response = self.client.get(reverse('adra:persona-update', kwargs={"pk": self.beneficario.pk}))
        assert response.context_data["up"] == "update"

    def test_adauga_alimentos_persona_get(self):
        response = self.client.get(reverse('adra:alimentos-create', kwargs={"pk": self.beneficario.pk}))
        assert response.status_code == 200

    def test_adauga_alimentos_persona_post_without_signature(self):
        response_without_signature = self.client.post(
            reverse('adra:alimentos-create', kwargs={"pk": self.beneficario.pk}), data={
                "alimento_1": 2,
                "alimento_2": 2,
                "alimento_3": 2,
                "alimento_4": 2,
                "alimento_5": 2,
                "alimento_6": 2,
                "alimento_7": 2,
                "alimento_8": 2,
                "alimento_9": 2,
                "alimento_10": 2,
                "alimento_11": 2,
                "alimento_12": 2,
                "alimento_13": 2,
                "fecha_recogida": date.today()
            }, follow=True)

        assert response_without_signature.status_code == 200

        response_with_signature = self.client.post(
            reverse('adra:alimentos-create', kwargs={"pk": self.beneficario.pk}), data={
                "alimento_1": 2,
                "alimento_2": 2,
                "alimento_3": 2,
                "alimento_4": 2,
                "alimento_5": 2,
                "alimento_6": 2,
                "alimento_7": 2,
                "alimento_8": 2,
                "alimento_9": 2,
                "alimento_10": 2,
                "alimento_11": 2,
                "alimento_12": 2,
                "alimento_13": 2,
                "fecha_recogida": date.today(),
                "signature": {
                    "x": [199, 202, 230, 242, 256, 264, 272, 280, 284, 282, 272, 260, 260, 262, 279, 336, 402, 462, 489,
                          493, 491, 487, 483, 475, 473, 474, 481, 491, 498, 498, 489, 472, 457, 424, 402, 393],
                    "y": [75, 78, 83, 83, 81, 77, 74, 70, 69, 66, 66, 80, 85, 93, 102, 112, 116, 116, 116, 112, 106,
                          102, 101, 104, 108, 116, 121, 122, 122, 116, 106, 100, 99, 102, 110, 116]
                }
            }, follow=True)

        assert response_with_signature.status_code == 200

    def test_almacen_view(self):
        response = self.client.get(reverse('adra:almacen-home'))
        assert response.context_data["almacen_adra"].count() > 0
        assert response.context_data["nbar"] == "almacen_a"
        assert response.status_code == 200

    def test_almacen_update(self):
        response = self.client.post(reverse('adra:almacen-update', kwargs={"pk": self.almacen_alimentos.pk}),
                                    data={'alimento_1': 755, 'alimento_2': 1103, 'alimento_3': 2371, 'alimento_4': 443,
                                          'alimento_5': 2213, 'alimento_6': 811, 'alimento_7': -2108,
                                          'alimento_8': 1174, 'alimento_9': 881, 'alimento_10': 158, 'alimento_11': 102,
                                          'alimento_12': 5581, 'alimento_13': 1548,
                                          'alimento_1_caducidad': date(2023, 10, 28),
                                          'alimento_2_caducidad': date(2027, 8, 27),
                                          'alimento_3_caducidad': date(2028, 12, 31),
                                          'alimento_4_caducidad': date(2024, 8, 30),
                                          'alimento_5_caducidad': date(2024, 10, 30),
                                          'alimento_6_caducidad': date(2024, 1, 20),
                                          'alimento_7_caducidad': date(2026, 4, 27),
                                          'alimento_8_caducidad': date(2025, 12, 31),
                                          'alimento_9_caducidad': date(2025, 9, 9),
                                          'alimento_10_caducidad': date(2024, 8, 31),
                                          'alimento_11_caducidad': date(2024, 8, 30),
                                          'alimento_12_caducidad': date(2023, 2, 23),
                                          'alimento_13_caducidad': date(2024, 2, 19)})

        assert response.status_code == 302
        response_get_with_context = self.client.get(
            reverse('adra:almacen-update', kwargs={"pk": self.almacen_alimentos.pk}))

        assert response_get_with_context.context_data["nbar"] == "almacen_a"
        assert response_get_with_context.status_code == 200

    def test_delete_familiar(self):
        response = self.client.post(reverse('adra:hijo-delete', kwargs={"pk": self.familiar.pk}))
        assert response.status_code == 302

    def test_anadir_familiar(self):
        response = self.client.post(reverse('adra:hijo-create', kwargs={"pk": self.beneficario.pk}), data={
            'parentesco': 'esposo',
            'nombre_apellido': 'Mariano Jimenez',
            'dni': 'x05400000q',
            'otros_documentos': '',
            'fecha_nacimiento': '1962-12-16',
            'sexo': 'hombre',
            'discapacidad': False
        })
        assert response.status_code == 302

        response_get = self.client.get(reverse('adra:hijo-create', kwargs={"pk": self.beneficario.pk}))
        assert response_get.status_code == 200

    def test_update_familiar(self):
        response = self.client.post(reverse('adra:hijo-update', kwargs={"pk": self.familiar.pk}), data={
            'parentesco': 'esposo',
            'nombre_apellido': 'Mariano Jimenez',
            'dni': 'x05400000q',
            'otros_documentos': '',
            'fecha_nacimiento': '1962-12-16',
            'sexo': 'hombre',
            'discapacidad': True
        }, flow=True)
        assert response.status_code == 302

        response_get_context = self.client.get(reverse('adra:hijo-update', kwargs={"pk": self.familiar.pk}))
        assert response_get_context.context_data["up"] == "update"
        assert response_get_context.status_code == 200

    def test_busqueda_beneficiario(self):
        response_get_with_digit = self.client.get(reverse('adra:buscar'), data={"q": "1"})
        assert response_get_with_digit.status_code == 200
        response_get_with_name = self.client.get(reverse('adra:buscar'), data={"q": "Maria Guapa"})
        assert response_get_with_name.status_code == 200
        response_no_activos = self.client.get(reverse('adra:buscar'), data={"q": "-1"})
        assert response_no_activos.status_code == 200
        response_no_activos = self.client.get(reverse('adra:buscar'), data={"qd": "-1"})
        assert response_no_activos.status_code == 200

    def test_statistics_beneficarios(self):
        response_get = self.client.get(reverse('adra:statistics-personas'))
        ds = {'total_per_mujer_02': 1,
              'total_per_mujer_03': 0,
              'total_per_mujer_16': 1,
              'total_per_mujer_65': 0,
              'total_mujeres': 2,
              'total_per_hombre_02': 0,
              'total_per_hombre_03': 0,
              'total_per_hombre_16': 0,
              'total_per_hombre_65': 0,
              'total_hombres': 0,
              'total_02': 1,
              'total_03': 0,
              'total_16': 1,
              'total_65': 0,
              'total_personas': 2,
              'discapacidad': 0,
              'total_beneficiarios': 1,
              'total_familiares': 1,
              'nbar': 'stat'
              }
        for k, v in ds.items():
            assert response_get.context[k] == v

    def test_valoracion_social_single(self):
        response_get = self.client.get(reverse('adra:docx_form', kwargs={"pk": self.beneficario.pk}))
        assert response_get.headers[
                   "Content-Disposition"] == f'attachment; filename={self.beneficario.numero_adra}.docx'
        assert response_get.headers[
                   "Content-Type"] == 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'

    def test_data_for_echart_statistics(self):
        response_get = self.client.get(reverse('adra:get_data'))
        count_altas = []
        years = Persona.objects.dates("created_at", "year").values_list("created_at__year", flat=True)
        for year in years:
            count_altas.append(Persona.objects.filter(created_at__year=year).count())

        assert functools.reduce(lambda x, y: x and y,
                                map(lambda p, q: p == q, count_altas, response_get.json()["reg"]),
                                True
                                )

        assert functools.reduce(lambda x, y: x and y,
                                map(lambda p, q: p == q, list(years), response_get.json()["years"]),
                                True
                                )

    def test_exportar_beneficiarios(self):
        response_get = self.client.get(reverse('adra:exportar-users-csv'))
        assert response_get.headers[
                   "Content-Disposition"] == f'attachment; filename=beneficiarios.xlsx'
        assert response_get.status_code == 200

    def test_busqueda_alimentos(self):
        data_request = {
            'created_at__year': '2022',
            'created_at__month': '11',
            'created_at__day': '17'
        }
        alimentos_columns = [
            "alimento_1",
            "alimento_2",
            "alimento_3",
            "alimento_4",
            "alimento_5",
            "alimento_6",
            "alimento_7",
            "alimento_8",
            "alimento_9",
            "alimento_10",
            "alimento_11",
            "alimento_12",
            "alimento_13",
        ]
        response_get = self.client.get(reverse('adra:buscar-por-fecha'), data=data_request)
        for column in alimentos_columns:
            assert response_get.context[column][f"{column}__sum"] == 2
        assert response_get.context['nbar'] == 'buscar_av'

    def test_alimentos_update_beneficiario(self):
        self.client.post(
            reverse('adra:alimentos-create', kwargs={"pk": self.beneficario.pk}), data={
                "alimento_1": 2,
                "alimento_2": 2,
                "alimento_3": 2,
                "alimento_4": 2,
                "alimento_5": 2,
                "alimento_6": 2,
                "alimento_7": 2,
                "alimento_8": 2,
                "alimento_9": 2,
                "alimento_10": 2,
                "alimento_11": 2,
                "alimento_12": 2,
                "alimento_13": 2,
                "fecha_recogida": date.today()
            }, follow=True)

        alimentos_quantity_negative = 4
        self.client.post(reverse('adra:persona-update-alimentos', kwargs={"pk": self.alimentos.pk}),
                         data={
                             "alimento_1": alimentos_quantity_negative,
                             "alimento_2": alimentos_quantity_negative,
                             "alimento_3": alimentos_quantity_negative,
                             "alimento_4": alimentos_quantity_negative,
                             "alimento_5": alimentos_quantity_negative,
                             "alimento_6": alimentos_quantity_negative,
                             "alimento_7": alimentos_quantity_negative,
                             "alimento_8": alimentos_quantity_negative,
                             "alimento_9": alimentos_quantity_negative,
                             "alimento_10": alimentos_quantity_negative,
                             "alimento_11": alimentos_quantity_negative,
                             "alimento_12": alimentos_quantity_negative,
                             "alimento_13": alimentos_quantity_negative,
                             "fecha_recogida": '2022-11-17',

                         })

        response = self.client.get(reverse('adra:almacen-home'))
        for alm in response.context['almacen_adra']:
            assert alm.alimento_1 == 96
            assert alm.alimento_2 == 96
            assert alm.alimento_3 == 96
            assert alm.alimento_4 == 96
            assert alm.alimento_5 == 96
            assert alm.alimento_6 == 96
            assert alm.alimento_7 == 96
            assert alm.alimento_8 == 96
            assert alm.alimento_9 == 96
            assert alm.alimento_10 == 96
            assert alm.alimento_11 == 96
            assert alm.alimento_12 == 96
            assert alm.alimento_13 == 96

        alimentos_quantity_positive = 2
        self.client.post(reverse('adra:persona-update-alimentos', kwargs={"pk": self.alimentos.pk}),
                         data={
                             "alimento_1": alimentos_quantity_positive,
                             "alimento_2": alimentos_quantity_positive,
                             "alimento_3": alimentos_quantity_positive,
                             "alimento_4": alimentos_quantity_positive,
                             "alimento_5": alimentos_quantity_positive,
                             "alimento_6": alimentos_quantity_positive,
                             "alimento_7": alimentos_quantity_positive,
                             "alimento_8": alimentos_quantity_positive,
                             "alimento_9": alimentos_quantity_positive,
                             "alimento_10": alimentos_quantity_positive,
                             "alimento_11": alimentos_quantity_positive,
                             "alimento_12": alimentos_quantity_positive,
                             "alimento_13": alimentos_quantity_positive,
                             "fecha_recogida": '2022-11-17',

                         })
        response = self.client.get(reverse('adra:almacen-home'))
        for alm in response.context['almacen_adra']:
            assert alm.alimento_1 == 98
            assert alm.alimento_2 == 98
            assert alm.alimento_3 == 98
            assert alm.alimento_4 == 98
            assert alm.alimento_5 == 98
            assert alm.alimento_6 == 98
            assert alm.alimento_7 == 98
            assert alm.alimento_8 == 98
            assert alm.alimento_9 == 98
            assert alm.alimento_10 == 98
            assert alm.alimento_11 == 98
            assert alm.alimento_12 == 98
            assert alm.alimento_13 == 98

    def test_generar_hoja_entrega_individual(self):
        response_individual = self.client.get(
            reverse('adra:pdf_form', kwargs={"pk": self.beneficario.pk, "mode": "sin"}))
        assert response_individual.headers[
                   "Content-Disposition"] == f'attachment; filename={self.beneficario.numero_adra}.pdf'
        assert response_individual.headers["Content-Type"] == 'application/pdf'
        assert response_individual.status_code == 200

        response_all = self.client.get(reverse('adra:pdf_form', kwargs={"pk": self.beneficario.pk, "mode": "con"}))
        assert response_all.headers[
                   "Content-Disposition"] == f'attachment; filename={self.beneficario.numero_adra}.zip'
        assert response_all.headers["Content-Type"] == "application/x-zip-compressed"
        assert response_all.status_code == 200

    def test_generar_hoja_entrega_global(self):
        response = self.client.get(reverse('adra:hoja_entrega_global'))
        assert response.headers["Content-Disposition"] == f'attachment; filename=hoja_entrega.zip'
        assert response.headers["Content-Type"] == "application/x-zip-compressed"
        assert response.status_code == 200

    def test_generar_valoracion_social_global(self):
        response = self.client.get(reverse('adra:valoracion_social'))
        assert response.headers["Content-Disposition"] == f'attachment; filename=valoraciones_sociales.zip'
        assert response.headers["Content-Type"] == "application/x-zip-compressed"
        assert response.status_code == 200

    def test_configuracion_front(self):
        response_get = self.client.get(reverse('adra:configuracion'))
        assert response_get.status_code == 200

        response_post_config = self.client.post(reverse('adra:configuracion'), data={
            'nombre': 'Madrid Torrejon',
            'oar': 'Adra Torrejon',
            'codigo_postal': '28850',
            'ciudad': 'Torrejon De Ardoz',
            'calle': 'C/ Primavera 15',
            'provincia': 'Madrid'
        })
        assert response_post_config.status_code == 302

        response_rest_papeles = self.client.post(reverse('adra:configuracion'), data={
            'reset_papeles': 'si',
        })
        assert response_rest_papeles.status_code == 302
        from django.core.files.uploadedfile import SimpleUploadedFile
        file = File(open('source_files/2022NotaEntregacalculadora.xlsx', 'rb'))
        file2 = File(open('source_files/2022NotaEntregacalculadora.xlsx', 'rb'))
        fp = SimpleUploadedFile('new_excel.xlsx', file.read(), content_type='multipart/form-data')
        fp2 = SimpleUploadedFile('new_excel2.xlsx', file2.read(), content_type='multipart/form-data')

        response_ingesta = self.client.post(reverse('adra:configuracion'), data={
            'record': fp,
        }, format='multipart')

        assert len(response_ingesta.json()["usuarios_fraud"]) == 0

        response_ingestra_fraud = self.client.post(reverse('adra:configuracion'), data={
            'record': fp2,
        }, format='multipart')
        assert len(response_ingestra_fraud.json()["usuarios_fraud"]) == 3
        print(response_ingesta.json())
        print(response_ingestra_fraud.json())
