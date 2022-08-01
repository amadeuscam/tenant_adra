import pytest
from adra.models import AlmacenAlimentos


@pytest.mark.django_db
def test_str_hijo(almacen_alimentos):
    assert AlmacenAlimentos.caducidad(AlmacenAlimentos, number=2) == 76
