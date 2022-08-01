import pytest

@pytest.mark.django_db
def test_alimento_create(init_data):
    _, _, alimentos = init_data
    assert alimentos.alimento_2 == 2


@pytest.mark.django_db
def test_alimento_absolute_url(init_data):
    _, _, alimentos = init_data
    assert alimentos.get_absolute_url() == f'/persona/{alimentos.persona.pk}/'


@pytest.mark.django_db
def test_user_create(init_data):
    user, _, _ = init_data
    assert user.check_password("masina") is True


@pytest.mark.django_db
def test_persona_create(init_data):
    _, persona, _ = init_data
    assert str(persona) == "Florin salam"

@pytest.mark.django_db
def test_persona_absolute_url(init_data):
    _, persona, _ = init_data
    assert persona.get_absolute_url()

@pytest.mark.django_db
def test_persona_age(init_data):
    _, persona, _ = init_data
    assert persona.age == 0

