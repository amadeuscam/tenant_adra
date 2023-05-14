from datetime import date, datetime

from django.test import TestCase

from adra.models import Alimentos, AlmacenAlimentos, Hijo, Persona, Profile
from adra.templatetags.verbose_names import (get_verbose_field_name,
                                             proxima_caducidad)


def test_verbose_field_name():
    vrb = get_verbose_field_name(Alimentos, "alimento_7")
    vrb_str = get_verbose_field_name("Alimentos", "alimento_7")
    assert vrb == "Tomate Frito En Conserva"
    assert vrb_str == "Tomate Frito En Conserva"


def test_proxima_caducidad(db, almacen_alimentos):
    almacen = almacen_alimentos.create()
    ast = proxima_caducidad(almacen, 2)
    assert ast == ast
