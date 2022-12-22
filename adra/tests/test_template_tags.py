from datetime import date, datetime

from django.test import TestCase
from adra.templatetags.verbose_names import get_verbose_field_name, proxima_caducidad
from adra.models import Persona, Hijo, Alimentos, AlmacenAlimentos, Profile


class TestTemplateTags:

    # def setUp(self):
    #     self.almacen_alimentos = AlmacenAlimentos.objects.create(
    #         alimento_1=2,
    #         alimento_2=2,
    #         alimento_3=2,
    #         alimento_4=2,
    #         alimento_5=2,
    #         alimento_6=2,
    #         alimento_7=2,
    #         alimento_8=2,
    #         alimento_9=2,
    #         alimento_10=2,
    #         alimento_11=2,
    #         alimento_12=2,
    #         alimento_13=2,
    #         alimento_1_caducidad=date(2020, 0o1, 27),
    #         alimento_2_caducidad=date(2022, 0o1, 27),
    #         alimento_3_caducidad=date(2020, 0o1, 27),
    #         alimento_4_caducidad=date(2020, 0o1, 27),
    #         alimento_5_caducidad=date(2020, 0o1, 27),
    #         alimento_6_caducidad=date(2020, 0o1, 27),
    #         alimento_7_caducidad=date(2020, 0o1, 27),
    #         alimento_8_caducidad=date(2020, 0o1, 27),
    #         alimento_9_caducidad=date(2020, 0o1, 27),
    #         alimento_10_caducidad=date(2020, 0o1, 27),
    #         alimento_11_caducidad=date(2020, 0o1, 27),
    #         alimento_12_caducidad=date(2020, 0o1, 27),
    #         alimento_13_caducidad=date(2020, 0o1, 27),
    #     )

    def test_verbose_field_name(self):
        vrb = get_verbose_field_name(Alimentos, "alimento_7")
        vrb_str = get_verbose_field_name("Alimentos", "alimento_7")
        assert vrb == "Macedonia De Verduras En Conserva"
        assert vrb_str == "Macedonia De Verduras En Conserva"

    def test_proxima_caducidad(self, db, store_alimentos_factory):
        ast = proxima_caducidad(store_alimentos_factory, 2)
        assert ast == ast
