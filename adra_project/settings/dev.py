from .base import *  # noqa
import os

DEBUG = True

ALLOWED_HOSTS = ["*"]

DATABASES = {
    "default": {
        "ENGINE": "django_tenants.postgresql_backend",
        "CONN_MAX_AGE": 3600,
        "NAME": os.environ.get("DATABASE_NAME"),
        "USER": os.environ.get("MYSQL_USER"),
        "PASSWORD": os.environ.get("MYSQL_PASSWORD"),
        "HOST": os.environ.get("MYSQL_HOST"),
        "PORT": 5432,
    }
}

EMAIL_BACKEND = "django.core.mail.backends.console.EmailBackend"
# STATICFILES_STORAGE = "whitenoise.storage.CompressedManifestStaticFilesStorage"

STATIC_ROOT = "app/static/"
STATIC_URL = "app/static/"


sentry_sdk.init(dsn=None)
