import functools
import os
import re
from datetime import date

import pytest
from django.conf import settings
from django.core.files import File
from django.urls import reverse
from django_tenants.test.cases import TenantTestCase
from django_tenants.test.client import TenantClient

from adra.models import Persona


class TestViews(TenantTestCase):
    @pytest.fixture(autouse=True)
    def use_benefiario_fixture(
        self,
        familiares,
        alimentos,
        almacen_alimentos,
        beneficario_glb,
        beneficiario_json,
        alimentos_json,
        almacen_alimentos_json,
        familiar_json,
        beneficario,
        aliments_a_repatir,
        aliments_a_repatir_json_post,
        capsys,
    ):
        self.beneficario = beneficario
        self.familiar = familiares
        self.alimentos = alimentos
        self.almacen_alimentos = almacen_alimentos
        self.beneficario_glb = beneficario_glb
        self.beneficiario_json = beneficiario_json
        self.alimentos_json = alimentos_json
        self.almacen_alimentos_json = almacen_alimentos_json
        self.familiar_json = familiar_json
        self.aliments_a_repatir = aliments_a_repatir
        self.aliments_a_repatir_json_post = aliments_a_repatir_json_post
        self.capsys = capsys

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
        self.client.login(
            username="lucian", password=os.environ.get("SUPERUSER_PASSWORD")
        )
        self.beneficario_inst = self.beneficario.create(id=1)
        # self.user_fa = self.user_fa.create()

        # self.user = User.objects.get(id=1)

    def test_edit_profile_get(self):
        response = self.client.get(reverse("adra:edit-profile"))
        assert response.status_code == 200

    def test_download_alimentos_repartidos(self):
        # self.aliments_a_repatir.create(pk=1)
        self.alimentos.create()
        response = self.client.post(reverse("adra:buscar-por-fecha"),data={"download":"download"})
        print(response)

        assert response.status_code == 200


    def test_edit_profile_post(self):
        edit_profile_dict = {
            "sexo": "mujer",
            "first_names": "vasile",
            "last_name": "moza",
            "date_of_birth": "1990-01-27",
            "email": "a@test.es",
        }
        response_valid = self.client.post(
            reverse("adra:edit-profile"), data=edit_profile_dict, follow=True
        )
        assert response_valid.status_code == 200
        response_invalid = self.client.post(
            reverse("adra:edit-profile"), data={}
        )
        assert response_invalid.status_code == 200

    def test_persona_detilview(self):
        response = self.client.get(
            reverse(
                "adra:personas_detail", kwargs={"pk": self.beneficario_inst.pk}
            )
        )
        assert "filter" in response.context_data.keys()

    def test_persona_list_view(self):
        response = self.client.get(reverse("adra:persona-home"))
        assert response.context_data["nbar"] == "home"
        assert response.context_data["debug"] == settings.DEBUG
        assert response.context_data["platform_name"] == settings.PLATFORM_NAME

    def test_persona_create_view_with_globals(self):
        self.beneficario_glb.create()
        response = self.client.post(
            reverse("adra:persona-create"), data=self.beneficiario_json
        )
        assert response.status_code == 200

    def test_persona_create_view(self):
        self.beneficiario_json.update({"nombre_apellido": "John Doe"})
        response = self.client.post(
            reverse("adra:persona-create"),
            data=self.beneficiario_json,
            follow=True,
        )
        assert response.status_code == 200

    def test_persona_create_view_get(self):
        response = self.client.get(reverse("adra:persona-create"))
        assert response.context_data["bas"].__str__() == "Maria Fernandez"
        Persona.objects.all().delete()
        response = self.client.get(reverse("adra:persona-create"))
        assert response.context_data["bas"] is None

    def test_persona_update_view(self):
        self.beneficiario_json.update(
            {"nombre_apellido": "John Doe", "telefono": 312570235}
        )
        response = self.client.post(
            reverse(
                "adra:persona-update", kwargs={"pk": self.beneficario_inst.pk}
            ),
            data=self.beneficiario_json,
            follow=True,
        )
        assert response.status_code == 200

    def test_persona_update_view_context(self):
        response = self.client.get(
            reverse(
                "adra:persona-update", kwargs={"pk": self.beneficario_inst.pk}
            )
        )
        assert response.context_data["up"] == "update"

    def test_adauga_alimentos_persona_get(self):
        self.almacen_alimentos.create(pk=2)
        self.aliments_a_repatir.create(pk=2)
        self.familiar.create()

        response = self.client.get(
            reverse(
                "adra:alimentos-create",
                kwargs={"pk": self.beneficario_inst.pk},
            )
        )
        for index in range(1, 13):
            value = int(
                re.findall(
                    r"\d+", str(response.context["form"][f"alimento_{index}"])
                )[1]
            )
            if index in [11, 12]:
                assert value == 3
            elif index in [4]:
                assert value == 0
            else:
                assert value == 6
        assert response.status_code == 200

    def test_adauga_alimentos_persona_fullfill_unit(self):
        self.almacen_alimentos.create(pk=2)
        self.aliments_a_repatir.create(pk=2)
        for d in range(3):
            self.familiar.create(
                fecha_nacimiento=f"199{d}-01-27",
                nombre_apellido=f"Mercedes{d}",
            )

        response = self.client.get(
            reverse(
                "adra:alimentos-create",
                kwargs={"pk": self.beneficario_inst.pk},
            )
        )
        for index in range(1, 12):
            value = int(
                re.findall(
                    r"\d+", str(response.context["form"][f"alimento_{index}"])
                )[1]
            )
            print(index, value)
            if index in [11, 12]:
                assert value == 0
            elif index in [4]:
                assert value == 0
            else:
                assert value == 12
        assert response.status_code == 200

    def test_adauga_alimentos_persona_fullfill_family(self):
        self.almacen_alimentos.create(pk=2)
        self.aliments_a_repatir.create(
            pk=2,
            alimento_1_type="familia",
            alimento_1_0_3=3,
            alimento_1_4_6=5,
            alimento_1_7_9=9,
            alimento_2_type="familia",
            alimento_2_0_3=1,
            alimento_2_4_6=3,
            alimento_2_7_9=6,
        )
        for d in range(2):
            self.familiar.create(
                fecha_nacimiento=f"199{d}-01-01",
                nombre_apellido=f"Mercedes{d}",
            )

        response_03 = self.client.get(
            reverse(
                "adra:alimentos-create",
                kwargs={"pk": self.beneficario_inst.pk},
            )
        )
        for index in range(1, 13):
            value = int(
                re.findall(
                    r"\d+",
                    str(response_03.context["form"][f"alimento_{index}"]),
                )[1]
            )
            print(index, value)
            if index in [11, 12]:
                assert value == 0
            else:
                if index == 1:
                    assert value == 3
                if index == 2:
                    assert value == 1
        assert response_03.status_code == 200

        for d in range(3):
            self.familiar.create(
                fecha_nacimiento=f"199{d}-01-01",
                nombre_apellido=f"Mercedesz{d}",
            )

        response_4_6 = self.client.get(
            reverse(
                "adra:alimentos-create",
                kwargs={"pk": self.beneficario_inst.pk},
            )
        )
        for index in range(1, 13):
            value = int(
                re.findall(
                    r"\d+",
                    str(response_4_6.context["form"][f"alimento_{index}"]),
                )[1]
            )
            print(index, value)
            if index in [11, 12]:
                assert value == 0
            else:
                if index == 1:
                    assert value == 5
                if index == 2:
                    assert value == 3
        assert response_4_6.status_code == 200

        for d in range(4):
            self.familiar.create(
                fecha_nacimiento=f"199{d}-01-01",
                nombre_apellido=f"Mercedeszd{d}",
            )

        response_7_x = self.client.get(
            reverse(
                "adra:alimentos-create",
                kwargs={"pk": self.beneficario_inst.pk},
            )
        )
        for index in range(1, 13):
            value = int(
                re.findall(
                    r"\d+",
                    str(response_7_x.context["form"][f"alimento_{index}"]),
                )[1]
            )
            print(index, value)
            if index in [11, 12]:
                assert value == 0
            else:
                if index == 1:
                    assert value == 9
                if index == 2:
                    assert value == 6
        assert response_7_x.status_code == 200

        for d in range(6):
            self.familiar.create(
                fecha_nacimiento=f"199{d}-01-01",
                nombre_apellido=f"Mercedeszd{d}",
            )

        response_invalid = self.client.get(
            reverse(
                "adra:alimentos-create",
                kwargs={"pk": self.beneficario_inst.pk},
            )
        )
        assert response_invalid.status_code == 200

    def test_adauga_alimentos_persona_post_without_signature(self):
        self.almacen_alimentos.create(pk=2)
        response_without_signature = self.client.post(
            reverse(
                "adra:alimentos-create",
                kwargs={"pk": self.beneficario_inst.pk},
            ),
            data=self.alimentos_json,
            follow=True,
        )

        assert response_without_signature.status_code == 200
        self.alimentos_json.update(
            {
                "signature": [
                    {
                        "x": [
                            199,
                            202,
                            230,
                            242,
                            256,
                            264,
                            272,
                            280,
                            284,
                            282,
                            272,
                            260,
                            260,
                            262,
                            279,
                            336,
                            402,
                            462,
                            489,
                            493,
                            491,
                            487,
                            483,
                            475,
                            473,
                            474,
                            481,
                            491,
                            498,
                            498,
                            489,
                            472,
                            457,
                            424,
                            402,
                            393,
                        ],
                        "y": [
                            75,
                            78,
                            83,
                            83,
                            81,
                            77,
                            74,
                            70,
                            69,
                            66,
                            66,
                            80,
                            85,
                            93,
                            102,
                            112,
                            116,
                            116,
                            116,
                            112,
                            106,
                            102,
                            101,
                            104,
                            108,
                            116,
                            121,
                            122,
                            122,
                            116,
                            106,
                            100,
                            99,
                            102,
                            110,
                            116,
                        ],
                    }
                ]
            }
        )

        response_with_signature = self.client.post(
            reverse(
                "adra:alimentos-create",
                kwargs={"pk": self.beneficario_inst.pk},
            ),
            data=self.alimentos_json,
            follow=True,
        )

        assert response_with_signature.status_code == 200

    def test_almacen_view(self):
        self.almacen_alimentos.create()
        response = self.client.get(reverse("adra:almacen-home"))
        assert response.context_data["almacen_adra"].count() > 0
        assert response.context_data["nbar"] == "almacen_a"
        assert response.status_code == 200

    def test_almacen_update(self):
        almacen_alimentos = self.almacen_alimentos.create()
        response = self.client.post(
            reverse(
                "adra:almacen-update", kwargs={"pk": almacen_alimentos.pk}
            ),
            data=self.almacen_alimentos_json,
        )

        assert response.status_code == 302
        response_get_with_context = self.client.get(
            reverse("adra:almacen-update", kwargs={"pk": almacen_alimentos.pk})
        )

        assert response_get_with_context.context_data["nbar"] == "almacen_a"
        assert response_get_with_context.status_code == 200

    def test_delete_familiar(self):
        familiar = self.familiar.create(id=1)
        response = self.client.post(
            reverse("adra:hijo-delete", kwargs={"pk": familiar.pk})
        )
        assert response.status_code == 302

    def test_anadir_familiar(self):
        response = self.client.post(
            reverse(
                "adra:hijo-create", kwargs={"pk": self.beneficario_inst.pk}
            ),
            data=self.familiar_json,
        )
        assert response.status_code == 302

        response_get = self.client.get(
            reverse(
                "adra:hijo-create", kwargs={"pk": self.beneficario_inst.pk}
            )
        )
        assert response_get.status_code == 200

    def test_update_familiar(self):
        self.familiar_json.update({"dni": "x0540000q", "discapacidad": True})
        familiar = self.familiar.create(id=1)
        response = self.client.post(
            reverse("adra:hijo-update", kwargs={"pk": familiar.pk}),
            data=self.familiar_json,
            flow=True,
        )
        assert response.status_code == 302

        response_get_context = self.client.get(
            reverse("adra:hijo-update", kwargs={"pk": familiar.pk})
        )
        assert response_get_context.context_data["up"] == "update"
        assert response_get_context.status_code == 200

    def test_busqueda_beneficiario(self):
        response_get_with_digit = self.client.get(
            reverse("adra:buscar"), data={"q": "1"}
        )
        assert response_get_with_digit.status_code == 200
        response_get_with_name = self.client.get(
            reverse("adra:buscar"), data={"q": "Maria Fernandez"}
        )
        assert response_get_with_name.status_code == 200
        response_no_activos = self.client.get(
            reverse("adra:buscar"), data={"q": "-1"}
        )
        assert response_no_activos.status_code == 200
        response_no_activos = self.client.get(
            reverse("adra:buscar"), data={"qd": "-1"}
        )
        assert response_no_activos.status_code == 200

    def test_statistics_beneficarios(self):
        self.familiar.create(id=1)
        response_get = self.client.get(reverse("adra:statistics-personas"))
        print(response_get.context)
        ds = {
            "total_per_mujer_02": 0,
            "total_per_mujer_03": 1,
            "total_per_mujer_16": 1,
            "total_per_mujer_65": 0,
            "total_mujeres": 2,
            "total_per_hombre_02": 0,
            "total_per_hombre_03": 0,
            "total_per_hombre_16": 0,
            "total_per_hombre_65": 0,
            "total_hombres": 0,
            "total_02": 0,
            "total_03": 1,
            "total_16": 1,
            "total_65": 0,
            "total_personas": 2,
            "discapacidad": 0,
            "total_beneficiarios": 1,
            "total_familiares": 1,
            "nbar": "stat",
        }
        for k, v in ds.items():
            print(response_get.context[k])
            assert response_get.context[k] == v

    def test_valoracion_social_single(self):
        response_get = self.client.get(
            reverse("adra:docx_form", kwargs={"pk": self.beneficario_inst.pk})
        )
        assert (
            response_get.headers["Content-Disposition"]
            == f"attachment; filename={self.beneficario_inst.numero_adra}.docx"
        )
        assert (
            response_get.headers["Content-Type"]
            == "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
        )

    def test_data_for_echart_statistics(self):
        response_get = self.client.get(reverse("adra:get_data"))
        count_altas = []
        years = Persona.objects.dates("created_at", "year").values_list(
            "created_at__year", flat=True
        )
        for year in years:
            count_altas.append(
                Persona.objects.filter(created_at__year=year).count()
            )

        assert functools.reduce(
            lambda x, y: x and y,
            map(lambda p, q: p == q, count_altas, response_get.json()["reg"]),
            True,
        )

        assert functools.reduce(
            lambda x, y: x and y,
            map(
                lambda p, q: p == q, list(years), response_get.json()["years"]
            ),
            True,
        )

    def test_exportar_beneficiarios(self):
        response_get = self.client.get(reverse("adra:exportar-users-csv"))
        assert (
            response_get.headers["Content-Disposition"]
            == f"attachment; filename=beneficiarios.xlsx"
        )
        assert response_get.status_code == 200

    def test_busqueda_alimentos(self):
        self.alimentos.create()
        data_request = {
            "fecha_recogida__year": "2022",
            "fecha_recogida__month": "01",
            "fecha_recogida__day": "27",
        }
        del self.alimentos_json["fecha_recogida"]
        alimentos_columns = self.alimentos_json.keys()

        response_get = self.client.get(
            reverse("adra:buscar-por-fecha"), data=data_request
        )
        for column in alimentos_columns:
            assert response_get.context[column][f"{column}__sum"] == 2
        assert response_get.context["nbar"] == "buscar_av"

    def test_alimentos_update_beneficiario(self):
        self.almacen_alimentos.create(pk=2)
        alimento = self.alimentos.create(pk=1)

        alimentos_quantity_negative = 6
        response_scad = self.client.post(
            reverse(
                "adra:persona-update-alimentos", kwargs={"pk": alimento.pk}
            ),
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
                "fecha_recogida": "2022-11-18",
            },
        )

        response = self.client.get(reverse("adra:almacen-home"))
        for alm in response.context["almacen_adra"]:
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

        alimentos_quantity_positive = 2
        response_urc = self.client.post(
            reverse(
                "adra:persona-update-alimentos", kwargs={"pk": alimento.pk}
            ),
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
                "fecha_recogida": "2022-11-17",
            },
        )

        response = self.client.get(reverse("adra:almacen-home"))
        for alm in response.context["almacen_adra"]:
            assert alm.alimento_1 == 100
            assert alm.alimento_2 == 100
            assert alm.alimento_3 == 100
            assert alm.alimento_4 == 100
            assert alm.alimento_5 == 100
            assert alm.alimento_6 == 100
            assert alm.alimento_7 == 100
            assert alm.alimento_8 == 100
            assert alm.alimento_9 == 100
            assert alm.alimento_10 == 100
            assert alm.alimento_11 == 100
            assert alm.alimento_12 == 100

    def test_generar_hoja_entrega_individual_sin_firma(self):
        self.almacen_alimentos.create(pk=1)
        self.familiar.create_batch(
            2,
            fecha_nacimiento=date(2011, 0o1, 27),
            persona=self.beneficario_inst,
            nombre_apellido="Mercedessss Fernandez",
        )

        response_individual = self.client.get(
            reverse(
                "adra:pdf_form",
                kwargs={"pk": self.beneficario_inst.pk, "mode": "sin"},
            )
        )
        assert (
            response_individual.headers["Content-Disposition"]
            == f"attachment; filename={self.beneficario_inst.numero_adra}.pdf"
        )
        assert response_individual.headers["Content-Type"] == "application/pdf"
        assert response_individual.status_code == 200

    def test_generar_hoja_entrega_individual_con_firma(self):
        self.almacen_alimentos.create(pk=1)
        # self.alimentos.create_batch(2, persona=self.beneficario_inst, fecha_recogida="2022-01-27")
        self.alimentos.create_batch(
            2,
            persona=self.beneficario_inst,
            fecha_recogida="2022-01-28",
            signature=[
                {
                    "x": [
                        199,
                        202,
                        230,
                        242,
                        256,
                        264,
                        272,
                        280,
                        284,
                        282,
                        272,
                        260,
                        260,
                        262,
                        279,
                        336,
                        402,
                        462,
                        489,
                        493,
                        491,
                        487,
                        483,
                        475,
                        473,
                        474,
                        481,
                        491,
                        498,
                        498,
                        489,
                        472,
                        457,
                        424,
                        402,
                        393,
                    ],
                    "y": [
                        75,
                        78,
                        83,
                        83,
                        81,
                        77,
                        74,
                        70,
                        69,
                        66,
                        66,
                        80,
                        85,
                        93,
                        102,
                        112,
                        116,
                        116,
                        116,
                        112,
                        106,
                        102,
                        101,
                        104,
                        108,
                        116,
                        121,
                        122,
                        122,
                        116,
                        106,
                        100,
                        99,
                        102,
                        110,
                        116,
                    ],
                }
            ],
        )
        response_all = self.client.get(
            reverse(
                "adra:pdf_form",
                kwargs={"pk": self.beneficario_inst.pk, "mode": "con"},
            )
        )
        assert (
            response_all.headers["Content-Disposition"]
            == f"attachment; filename={self.beneficario_inst.numero_adra}.zip"
        )
        assert (
            response_all.headers["Content-Type"]
            == "application/x-zip-compressed"
        )

        assert response_all.status_code == 200

    def test_generar_hoja_entrega_individual_con_firma_v2(self):
        self.almacen_alimentos.create(pk=1)
        self.alimentos.create()

        response_all = self.client.get(
            reverse(
                "adra:pdf_form",
                kwargs={"pk": self.beneficario_inst.pk, "mode": "con"},
            )
        )
        assert (
            response_all.headers["Content-Disposition"]
            == f"attachment; filename={self.beneficario_inst.numero_adra}.zip"
        )
        assert (
            response_all.headers["Content-Type"]
            == "application/x-zip-compressed"
        )

        assert response_all.status_code == 200

    def test_generar_hoja_entrega_global(self):
        response = self.client.get(reverse("adra:hoja_entrega_global"))
        assert (
            response.headers["Content-Disposition"]
            == f"attachment; filename=hoja_entrega.zip"
        )
        assert (
            response.headers["Content-Type"] == "application/x-zip-compressed"
        )
        assert response.status_code == 200

    def test_generar_valoracion_social_global(self):
        response = self.client.get(reverse("adra:valoracion_social"))
        assert (
            response.headers["Content-Disposition"]
            == f"attachment; filename=valoraciones_sociales.zip"
        )
        assert (
            response.headers["Content-Type"] == "application/x-zip-compressed"
        )
        assert response.status_code == 200

    def test_configuracion_front(self):
        self.aliments_a_repatir.create(pk=2)
        alm_repatir = self.aliments_a_repatir_json_post
        del alm_repatir["modificado_por"]
        alm_repatir["form_reparto"] = ""
        print(self.aliments_a_repatir_json_post)

        response_get = self.client.get(reverse("adra:configuracion"))
        assert response_get.status_code == 200

        response_post_config = self.client.post(
            reverse("adra:configuracion"),
            data={
                "nombre": "Madrid Torrejon",
                "oar": "Adra Torrejon",
                "codigo_postal": "28850",
                "ciudad": "Torrejon De Ardoz",
                "calle": "C/ Primavera 15",
                "provincia": "Madrid",
            },
        )
        assert response_post_config.status_code == 302

        response_rest_papeles = self.client.post(
            reverse("adra:configuracion"),
            data={
                "reset_papeles": "si",
            },
        )
        assert response_rest_papeles.status_code == 302
        from django.core.files.uploadedfile import SimpleUploadedFile

        file = File(open("source_files/2022NotaEntregacalculadora.xlsx", "rb"))
        file2 = File(
            open("source_files/2022NotaEntregacalculadora.xlsx", "rb")
        )
        fp = SimpleUploadedFile(
            "new_excel.xlsx", file.read(), content_type="multipart/form-data"
        )
        fp2 = SimpleUploadedFile(
            "new_excel2.xlsx", file2.read(), content_type="multipart/form-data"
        )

        response_ingesta = self.client.post(
            reverse("adra:configuracion"),
            data={
                "record": fp,
            },
            format="multipart",
        )

        assert len(response_ingesta.json()["usuarios_fraud"]) == 0

        response_ingestra_fraud = self.client.post(
            reverse("adra:configuracion"),
            data={
                "record": fp2,
            },
            format="multipart",
        )
        assert len(response_ingestra_fraud.json()["usuarios_fraud"]) == 3
        # print(response_ingesta.json())
        # print(response_ingestra_fraud.json())

        response_post_alimentos_repartir = self.client.post(
            reverse("adra:configuracion"), data=alm_repatir
        )
        assert response_post_alimentos_repartir.status_code == 302
        # for index, (key, value) in enumerate(start=1, alm_repatir.items()):
        del alm_repatir["form_reparto"]
        for index in range(1, 13):
            if index != 4:
                assert alm_repatir[f"alimento_{index}"] == 3
                assert alm_repatir[f"alimento_{index}_type"] == "unidad"
                assert alm_repatir[f"alimento_{index}_0_3"] == 3
                assert alm_repatir[f"alimento_{index}_4_6"] == 3
                assert alm_repatir[f"alimento_{index}_7_9"] == 3
            else:
                assert alm_repatir[f"alimento_{index}"] == 0
