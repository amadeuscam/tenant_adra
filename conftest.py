import pytest
from pytest_factoryboy import register
from faker import Faker

faker = Faker()
import tests.factories

register(tests.factories.PersonaFactory)
register(tests.factories.FamiliarFactory)
register(tests.factories.AlmacenAlimentosFactory)
register(tests.factories.AlimentosFactory)
register(tests.factories.BeneficiarioGlobalFactory)
register(tests.factories.AlimentosRepatirFactory)
register(tests.factories.UserFactory)


@pytest.fixture
def ben_json(persona_factory):
    return tests.factories.generate_dict_factory(persona_factory)()


@pytest.fixture
def familiar_json(familiar_factory):
    return tests.factories.generate_dict_factory(familiar_factory)()


@pytest.fixture
def alimentos_json(alimentos_factory):
    return tests.factories.generate_dict_factory(alimentos_factory)()


@pytest.fixture
def almacen_alimentos_json(almacen_alimentos_factory):
    return tests.factories.generate_dict_factory(almacen_alimentos_factory)()


@pytest.fixture
def aliments_a_repatir_json_post(alimentos_repatir_factory):
    return tests.factories.generate_dict_factory(alimentos_repatir_factory)()
