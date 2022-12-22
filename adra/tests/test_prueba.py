import pytest
from django.contrib.auth.models import User


# @pytest.fixture(scope="session")
# def user_1(db):
#     user = User.objects.create_user("test_user")
#     print("create user")
#     return user
# @pytest.mark.django_db
# def test_beneficario(persona_factory):
#     beneficario = persona_factory.build()
#     print(beneficario.dni)
#     assert True
#
#
# def test_set_check_password(init_data):
#     user, beneficario = init_data
#     print("check user 1")
#     assert user.username == "test_user"
#
#
# def test_set_check_password2(init_data):
#     user, beneficario = init_data
#     print("check user 2")
#     assert user.username == "test_user"
