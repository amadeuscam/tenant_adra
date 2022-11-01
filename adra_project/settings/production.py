import os

from .base import *  # noqa

DEBUG = False

ALLOWED_HOSTS = ["www.repartoalimentos.com","repartoalimentos.com"]


DATABASES = {
    "default": {
        "ENGINE": os.getenv("SQL_ENGINE"),
        "NAME": os.getenv("SQL_DATABASE"),
        "USER": os.getenv("SQL_USER"),
        "PASSWORD": os.getenv("SQL_PASSWORD"),
        "HOST": os.getenv("SQL_HOST"),
        "PORT": os.getenv("SQL_PORT"),
    }
}

EMAIL_BACKEND = "sendgrid_backend.SendgridBackend"
SENDGRID_API_KEY = str(os.getenv("SENDGRID_API_KEY"))
SENDGRID_ALIMENTOS_TEMPLATE_ID = str(os.getenv("SENDGRID_TEMPLATE_ID"))
SENDGRID_SANDBOX_MODE_IN_DEBUG = False
SECURE_PROXY_SSL_HEADER = ("HTTP_X_FORWARDED_PROTO", "https")


# aws settings
AWS_ACCESS_KEY_ID = os.getenv("AWS_ACCESS_KEY_ID")
AWS_SECRET_ACCESS_KEY = os.getenv("AWS_SECRET_ACCESS_KEY")
AWS_STORAGE_BUCKET_NAME = os.getenv("AWS_STORAGE_BUCKET_NAME")
# AWS_DEFAULT_ACL = 'public-read'
AWS_S3_CUSTOM_DOMAIN = f"{AWS_STORAGE_BUCKET_NAME}.s3.amazonaws.com"
AWS_S3_OBJECT_PARAMETERS = {"CacheControl": "max-age=86400"}
# s3 static settings
AWS_LOCATION = "static"
STATIC_URL = f"https://{AWS_S3_CUSTOM_DOMAIN}/{AWS_LOCATION}/"
STATICFILES_STORAGE = "storages.backends.s3boto3.S3Boto3Storage"


sentry_sdk.init(
    dsn=f"{os.environ.get('SENTRY_SDK_URL')}",
    integrations=[DjangoIntegration()],
    environment="production",
)
