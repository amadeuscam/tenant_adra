import os

from .base import *  # noqa

DEBUG = True

ALLOWED_HOSTS = ["*"]

DATABASES = {
    "default": {
        "ENGINE": os.environ.get("SQL_ENGINE"),
        "NAME": os.environ.get("SQL_DATABASE"),
        "USER": os.environ.get("SQL_USER"),
        "PASSWORD": os.environ.get("SQL_PASSWORD"),
        "HOST": os.environ.get("SQL_HOST"),
        "PORT": os.environ.get("SQL_PORT"),
    }
}

EMAIL_BACKEND = "django.core.mail.backends.console.EmailBackend"
SENDGRID_SANDBOX_MODE_IN_DEBUG = True
# STATICFILES_STORAGE = "whitenoise.storage.CompressedManifestStaticFilesStorage"

STATIC_ROOT = "app/static/"
STATIC_URL = "app/static/"

sentry_sdk.init(dsn=None)
