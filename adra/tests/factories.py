from datetime import date

import factory
from faker import Faker
from adra.models import Persona, Hijo, Alimentos, AlmacenAlimentos, Profile

fake = Faker()


class PersonaFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = Persona

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


class HijoFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = Hijo

    nombre_apellido = "Mercedes Fernandez"
    parentesco = "hija"
    dni = "x00000000w"
    otros_documentos = ""
    fecha_nacimiento = date(2020, 0o1, 27)
    active = True
    discapacidad = False
    sexo = "mujer"
    persona = factory.SubFactory(PersonaFactory)

class AlmacenAlimentosFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = AlmacenAlimentos

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