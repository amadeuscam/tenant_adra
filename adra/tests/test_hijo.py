import pytest


@pytest.mark.django_db
def test_str_hijo(hijo_pentesco1):
    assert str(hijo_pentesco1) == 'jose mota'


@pytest.mark.django_db
def test_absolute_url(hijo_pentesco1):
    assert hijo_pentesco1.get_absolute_url() == f'/persona/{hijo_pentesco1.persona.pk}/'


@pytest.mark.django_db
def test_age(hijo_pentesco1):
    assert hijo_pentesco1.age == 31


@pytest.mark.django_db
def test_save_esposa(hijo_pentesco1):
    assert hijo_pentesco1.sexo == 'm'


@pytest.mark.django_db
def test_save_esposo(hijo_pentesco2):
    assert hijo_pentesco2.sexo == 'h'


@pytest.mark.django_db
def test_save_hijo(hijo_pentesco3):
    assert hijo_pentesco3.sexo == 'h'


@pytest.mark.django_db
def test_save_hija(hijo_pentesco4):
    assert hijo_pentesco4.sexo == 'm'
