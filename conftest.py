import pytest
from adra.models import Alimentos, Persona, Hijo, AlmacenAlimentos, Profile
from django.contrib.auth.models import User
from datetime import datetime
from datetime import date
from django.utils import timezone

from pytest_factoryboy import register
from adra.tests.factories import (PersonaFactory, HijoFactory, AlmacenAlimentosFactory, AlimentosFactory,
                                  BeneficiarioGlobalFactory, AlimentosRepatirFactory)

register(PersonaFactory)
register(HijoFactory)
register(AlmacenAlimentosFactory)
register(AlimentosFactory)
register(BeneficiarioGlobalFactory)
register(AlimentosRepatirFactory)


# @pytest.fixture
# def init_fam_ben(db, persona_factory, hijo_factory):
#     familiar = hijo_factory.create()
#     beneficario = persona_factory.create()
#     return familiar, beneficario
#

@pytest.fixture
def beneficario(persona_factory):
    return persona_factory


@pytest.fixture
def familiares(hijo_factory):
    return hijo_factory


@pytest.fixture
def alimentos(alimentos_factory):
    return alimentos_factory


@pytest.fixture
def almacen_alimentos(almacen_alimentos_factory):
    return almacen_alimentos_factory


@pytest.fixture
def beneficiario_json():
    return {'nombre_apellido': 'sdasW32dasdas', 'dni': 'x0000000q',
            'fecha_nacimiento': date(2022, 12, 13), 'numero_adra': 423,
            'nacionalidad': 'Rumana', 'domicilio': 'dsa', 'are_acte': False,
            'ciudad': 'Torrejon De Ardoz', 'telefono': 000000000, 'mensaje': 'dasdas',
            'sexo': 'hombre', 'discapacidad': False, 'empadronamiento': True,
            'libro_familia': False, 'fotocopia_dni': True, 'prestaciones': True,
            'nomnia': True, 'cert_negativo': True, 'aquiler_hipoteca': True,
            'recibos': True, 'email': 'a@yahoo.es', 'covid': False,
            'codigo_postal': 28850, 'otros_documentos': '', 'active': True}


@pytest.fixture
def familiar_json():
    return {
        'parentesco': 'esposo',
        'nombre_apellido': 'Mariano Jimenez',
        'dni': 'x05400000q',
        'otros_documentos': '',
        'fecha_nacimiento': '1962-12-16',
        'sexo': 'hombre',
        'discapacidad': False
    }


@pytest.fixture
def beneficario_glb(beneficiario_global_factory):
    return beneficiario_global_factory


@pytest.fixture
def alimentos_json():
    return {
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
        "fecha_recogida": "2022-11-17"
    }


@pytest.fixture
def almacen_alimentos_json():
    return {'alimento_1': 755, 'alimento_2': 1103, 'alimento_3': 2371, 'alimento_4': 443,
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
            'alimento_13_caducidad': date(2024, 2, 19)}


@pytest.fixture()
def aliments_a_repatir(alimentos_repatir_factory):
    return alimentos_repatir_factory


@pytest.fixture()
def aliments_a_repatir_json_post(alimentos_repatir_factory):
    # from django.core import serializers
    # data = serializers.serialize('json', alimentos_repatir_factory.stub())
    return alimentos_repatir_factory.stub().__dict__
