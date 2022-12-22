import pytest
from adra.models import Alimentos, Persona, Hijo, AlmacenAlimentos, Profile
from django.contrib.auth.models import User
from datetime import datetime
from datetime import date
from django.utils import timezone

from pytest_factoryboy import register
from adra.tests.factories import PersonaFactory, HijoFactory, AlmacenAlimentosFactory

register(PersonaFactory)
register(HijoFactory)
register(AlmacenAlimentosFactory)


@pytest.fixture()
def init_fam_ben(db, persona_factory, hijo_factory):
    familiar = hijo_factory.create()
    beneficario = persona_factory.create()
    return familiar, beneficario


@pytest.fixture
def blog_2(hijo_factory):
    return hijo_factory.create()


@pytest.fixture
def store_alimentos_factory(almacen_alimentos_factory):
    return almacen_alimentos_factory.create()
#
# @pytest.fixture()
# def init_data(db):
#     user = User.objects.create_user("test_user", "a@test.es", "masina")
#     beneficario = Persona.objects.create(
#         nombre_apellido="Maria Guapa",
#         dni="x00000000q",
#         otros_documentos="",
#         fecha_nacimiento=date(1990, 0o1, 27),
#         numero_adra=1,
#         nacionalidad="española",
#         domicilio="calle sin numero",
#         are_acte=True,
#         ciudad="Madrid",
#         telefono="312570235",
#         modificado_por_id=1,
#         mensaje="alta nueva",
#         active=True,
#         sexo="mujer",
#         discapacidad=False,
#         aquiler_hipoteca=True,
#         cert_negativo=True,
#         empadronamiento=True,
#         fotocopia_dni=True,
#         libro_familia=True,
#         nomnia=True,
#         prestaciones=True,
#         recibos=True,
#         email="a@test.es",
#         covid=False,
#         codigo_postal=28850,
#     )
#
#     # alimentos = Alimentos.objects.create(
#     #     alimento_1=2,
#     #     alimento_2=2,
#     #     alimento_3=2,
#     #     alimento_4=2,
#     #     alimento_5=2,
#     #     alimento_6=2,
#     #     alimento_7=2,
#     #     alimento_8=2,
#     #     alimento_9=2,
#     #     alimento_10=2,
#     #     alimento_11=2,
#     #     alimento_12=2,
#     #     persona_id=persona.pk,
#     #     modificado_por_id=user.pk,
#     #     fecha_recogida=datetime.now(tz=timezone.utc),
#     # )
#
#     return user, beneficario
#
#
# @pytest.fixture()
# def hijo_data(db, init_data):
#     user, persona, _ = init_data
#     hijo = Hijo.objects.create(
#         nombre_apellido="maria jose",
#         parentesco="hija",
#         dni="x0130000x",
#         fecha_nacimiento=datetime(1990, 1, 27, 23, 59, 0),
#         edad=32,
#         persona_id=persona.pk,
#         modificado_por_id=user.pk,
#     )
#     return hijo
#
#
# @pytest.fixture
# def new_hijo_factory(db):
#     def create_app_hijo(
#             nombre_apellido: str = "jose mota",
#             parentesco: str = "hijo",
#             dni: str = "x0000000x",
#             fecha_nacimiento: datetime = datetime(1990, 1, 27, 23, 59, 0),
#             edad: int = 32,
#             persona_id: int = None,
#             modificado_por_id: int = None,
#     ):
#         hijo2 = Hijo.objects.create(
#             nombre_apellido=nombre_apellido,
#             parentesco=parentesco,
#             dni=dni,
#             fecha_nacimiento=fecha_nacimiento,
#             edad=edad,
#             persona_id=persona_id,
#             modificado_por_id=modificado_por_id,
#         )
#         return hijo2
#
#     return create_app_hijo
#
#
# @pytest.fixture
# def hijo_pentesco1(db, new_hijo_factory, init_data):
#     user, persona, _ = init_data
#     return new_hijo_factory(
#         parentesco="esposa", modificado_por_id=user.pk, persona_id=persona.pk
#     )
#
#
# @pytest.fixture
# def hijo_pentesco2(db, new_hijo_factory, init_data):
#     user, persona, _ = init_data
#     return new_hijo_factory(
#         parentesco="esposo", modificado_por_id=user.pk, persona_id=persona.pk
#     )
#
#
# @pytest.fixture
# def hijo_pentesco3(db, new_hijo_factory, init_data):
#     user, persona, _ = init_data
#     return new_hijo_factory(
#         parentesco="hijo", modificado_por_id=user.pk, persona_id=persona.pk
#     )
#
#
# @pytest.fixture
# def hijo_pentesco4(db, new_hijo_factory, init_data):
#     user, persona, _ = init_data
#     return new_hijo_factory(
#         parentesco="hija", modificado_por_id=user.pk, persona_id=persona.pk
#     )
#
#
# @pytest.fixture
# def almacen_alimentos(db, init_data):
#     user, persona, _ = init_data
#     almacen = AlmacenAlimentos.objects.create(
#         alimento_1=200,
#         alimento_2=200,
#         alimento_3=200,
#         alimento_4=200,
#         alimento_5=200,
#         alimento_6=200,
#         alimento_7=200,
#         alimento_8=200,
#         alimento_9=200,
#         alimento_10=200,
#         alimento_11=200,
#         alimento_12=200,
#         modificado_por_id=user.pk,
#         alimento_1_caducidad=date(2021, 12, 5),
#         alimento_2_caducidad=date(2021, 12, 5),
#         alimento_3_caducidad=date(2021, 12, 5),
#         alimento_4_caducidad=date(2021, 12, 5),
#         alimento_5_caducidad=date(2021, 12, 5),
#         alimento_6_caducidad=date(2021, 12, 5),
#         alimento_7_caducidad=date(2021, 12, 5),
#         alimento_8_caducidad=date(2021, 12, 5),
#         alimento_9_caducidad=date(2021, 12, 5),
#         alimento_10_caducidad=date(2021, 12, 5),
#         alimento_11_caducidad=date(2021, 12, 5),
#         alimento_12_caducidad=date(2021, 12, 5),
#     )
#     return almacen
#
#
# @pytest.fixture
# def profile(db, init_data):
#     user, _, _ = init_data
#     prof = Profile.objects.create(
#         user_id=user.pk, date_of_birth=date(1990, 12, 5)
#     )
#     return prof
