import os
from datetime import date

import factory
from functools import partial
from typing import Any, Dict


from factory import Factory
from factory.base import StubObject

from django.contrib.auth import get_user_model
from faker import Factory as FakerFactory
from faker import Faker

from adra.models import (
    Alimentos,
    AlimentosRepatir,
    AlmacenAlimentos,
    Hijo,
    Persona,
    Profile,
)
from delegaciones.models import BeneficiariosGlobales

faker = Faker("es_ES")
# faker = FakerFactory.create()
from django.contrib.auth.models import User


class PersonaFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = Persona
        django_get_or_create = ("nombre_apellido",)

    nombre_apellido = "Maria Fernandez"
    dni = "x00000000q"
    otros_documentos = ""
    fecha_nacimiento = date(1990, 0o1, 27)
    numero_adra = 1
    nacionalidad = "española"
    domicilio = "calle sin numero"
    are_acte = True
    ciudad = "Madrid"
    telefono = "312570235"
    modificado_por_id = 1
    mensaje = "alta nueva"
    active = True
    sexo = "mujer"
    discapacidad = False
    aquiler_hipoteca = True
    cert_negativo = True
    empadronamiento = True
    fotocopia_dni = True
    libro_familia = True
    nomnia = True
    prestaciones = True
    recibos = True
    email = "a@test.es"
    covid = False
    codigo_postal = 28850


class FamiliarFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = Hijo
        django_get_or_create = ("id",)
        
    id = 10
    nombre_apellido = faker.name()
    parentesco = "hija"
    dni = faker.nie()
    otros_documentos = ""
    fecha_nacimiento = date(2018, 0o1, 27)
    active = True
    discapacidad = False
    sexo = "mujer"
    persona = factory.SubFactory(PersonaFactory)


class AlmacenAlimentosFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = AlmacenAlimentos

    alimento_1 = 100
    alimento_2 = 100
    alimento_3 = 100
    alimento_4 = 100
    alimento_5 = 100
    alimento_6 = 100
    alimento_7 = 100
    alimento_8 = 100
    alimento_9 = 100
    alimento_10 = 100
    alimento_11 = 100
    alimento_12 = 100
    alimento_13 = 100
    alimento_14 = 100
    alimento_15 = 100
    alimento_16 = 100
    alimento_1_caducidad = date(2020, 0o1, 27)
    alimento_2_caducidad = date(2022, 0o1, 27)
    alimento_3_caducidad = date(2020, 0o1, 27)
    alimento_4_caducidad = date(2020, 0o1, 27)
    alimento_5_caducidad = date(2020, 0o1, 27)
    alimento_6_caducidad = date(2020, 0o1, 27)
    alimento_7_caducidad = date(2020, 0o1, 27)
    alimento_8_caducidad = date(2020, 0o1, 27)
    alimento_9_caducidad = date(2020, 0o1, 27)
    alimento_10_caducidad = date(2020, 0o1, 27)
    alimento_11_caducidad = date(2020, 0o1, 27)
    alimento_12_caducidad = date(2020, 0o1, 27)
    alimento_13_caducidad = date(2020, 0o1, 27)
    alimento_14_caducidad = date(2020, 0o1, 27)
    alimento_15_caducidad = date(2020, 0o1, 27)
    alimento_16_caducidad = date(2020, 0o1, 27)


class AlimentosFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = Alimentos
        django_get_or_create = ("id",)

    id = 10
    alimento_1 = 2
    alimento_2 = 2
    alimento_3 = 2
    alimento_4 = 2
    alimento_5 = 2
    alimento_6 = 2
    alimento_7 = 2
    alimento_8 = 2
    alimento_9 = 2
    alimento_10 = 2
    alimento_11 = 2
    alimento_12 = 2
    alimento_13 = 2
    alimento_14 = 2
    alimento_15 = 2
    alimento_16 = 2
    fecha_recogida = date(2022, 0o1, 27)
    persona = factory.SubFactory(PersonaFactory)


class BeneficiarioGlobalFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = BeneficiariosGlobales

    delegacion_name = "adra torrejon"
    delegacion_code = 1
    documentacion_beneficiario = faker.nie()
    ciudad = "Madrid"
    provincia = "Madrid"
    telefono = int(faker.phone_number().split("+34")[1].replace(" ", ""))
    nombre_beneficiario = faker.name()


class UserFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = User


class AlimentosRepatirFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = AlimentosRepatir

    alimento_1 = 3
    alimento_1_type = "unidad"
    alimento_1_0_3 = 2
    alimento_1_4_6 = 5
    alimento_1_7_9 = 7
    alimento_2 = 3
    alimento_2_type = "unidad"
    alimento_2_0_3 = 2
    alimento_2_4_6 = 5
    alimento_2_7_9 = 7
    alimento_3 = 3
    alimento_3_type = "unidad"
    alimento_3_0_3 = 3
    alimento_3_4_6 = 3
    alimento_3_7_9 = 3
    alimento_4 = 0
    alimento_4_type = "unidad"
    alimento_4_0_3 = 3
    alimento_4_4_6 = 3
    alimento_4_7_9 = 3
    alimento_5 = 3
    alimento_5_type = "unidad"
    alimento_5_0_3 = 3
    alimento_5_4_6 = 3
    alimento_5_7_9 = 3
    alimento_6 = 3
    alimento_6_type = "unidad"
    alimento_6_0_3 = 3
    alimento_6_4_6 = 3
    alimento_6_7_9 = 3
    alimento_7 = 3
    alimento_7_type = "unidad"
    alimento_7_0_3 = 3
    alimento_7_4_6 = 3
    alimento_7_7_9 = 3
    alimento_8 = 3
    alimento_8_type = "unidad"
    alimento_8_0_3 = 3
    alimento_8_4_6 = 3
    alimento_8_7_9 = 3
    alimento_9 = 3
    alimento_9_type = "unidad"
    alimento_9_0_3 = 3
    alimento_9_4_6 = 3
    alimento_9_7_9 = 3
    alimento_10 = 3
    alimento_10_type = "unidad"
    alimento_10_0_3 = 3
    alimento_10_4_6 = 3
    alimento_10_7_9 = 3
    alimento_11 = 3
    alimento_11_type = "unidad"
    alimento_11_0_3 = 3
    alimento_11_4_6 = 3
    alimento_11_7_9 = 3
    alimento_12 = 3
    alimento_12_type = "unidad"
    alimento_12_0_3 = 3
    alimento_12_4_6 = 3
    alimento_12_7_9 = 3
    alimento_13 = 3
    alimento_13_type = "unidad"
    alimento_13_0_3 = 3
    alimento_13_4_6 = 3
    alimento_13_7_9 = 3
    alimento_14 = 3
    alimento_14_type = "unidad"
    alimento_14_0_3 = 3
    alimento_14_4_6 = 3
    alimento_14_7_9 = 3
    alimento_15 = 3
    alimento_15_type = "unidad"
    alimento_15_0_3 = 3
    alimento_15_4_6 = 3
    alimento_15_7_9 = 3
    alimento_16 = 3
    alimento_16_type = "unidad"
    alimento_16_0_3 = 3
    alimento_16_4_6 = 3
    alimento_16_7_9 = 3


def generate_dict_factory(factory: Factory):
    def convert_dict_from_stub(stub: StubObject) -> Dict[str, Any]:
        stub_dict = stub.__dict__
        for key, value in stub_dict.items():
            if isinstance(value, StubObject):
                stub_dict[key] = convert_dict_from_stub(value)
        return stub_dict

    def dict_factory(factory, **kwargs):
        stub = factory.stub(**kwargs)
        stub_dict = convert_dict_from_stub(stub)
        return stub_dict

    return partial(dict_factory, factory)
