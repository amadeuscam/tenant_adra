from adra.models import Alimentos
from adra.templatetags.verbose_names import (
    get_verbose_field_name,
    proxima_caducidad,
)


def test_verbose_field_name():
    vrb = get_verbose_field_name(Alimentos, "alimento_7")
    vrb_str = get_verbose_field_name("Alimentos", "alimento_7")
    assert vrb == "Tomate Frito En Conserva (Apis)"
    assert vrb_str == "Tomate Frito En Conserva (Apis)"


def test_proxima_caducidad(db, almacen_alimentos):
    ast = proxima_caducidad(almacen_alimentos, 2)
    assert ast == ast
