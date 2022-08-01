import pytest


@pytest.mark.django_db
def test_profile_user(profile):
    assert str(profile) == f'Profile for user {profile.user}'
