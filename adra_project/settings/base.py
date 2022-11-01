import os
from pathlib import Path

import sentry_sdk
from sentry_sdk.integrations.django import DjangoIntegration

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
# BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BASE_DIR = Path(__file__).resolve(strict=True).parent.parent.parent

# os.environ.setdefault("DJANGO_SETTINGS_MODULE", "adra_project.settings.dev")
# SECURITY WARNING: keep the secret key used in production secret!
# SECRET_KEY = os.getenv("SECRET_KEY")
SECRET_KEY = os.getenv("SECRET_KEY")
ALLOWED_HOSTS = ['.localhost', '*']
# django-allauth config
SITE_ID = 1
SESSION_COOKIE_AGE = 86400
DATABASE_ROUTERS = (
    'django_tenants.routers.TenantSyncRouter',
)

TOKEN_KEY_USER = os.getenv("Token_KEY_USER")
# Application definition
list_apps = [
    'django.contrib.contenttypes',
    "jsignature",
    # default
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.sessions",
    "django.contrib.messages",
    "whitenoise.runserver_nostatic",
    "django.contrib.staticfiles",
    "django.contrib.sites",
    "django_filters",
    "crispy_forms",
    # auth zone
    "allauth",
    "allauth.account",
    # api zone rest
    "rest_framework",
    "rest_framework.authtoken",
    'tenant_schemas_celery',
    "corsheaders",
    # s3 amazon
    "storages",
    # "allauth.socialaccount",
]
SHARED_APPS = [
                  'django_tenants',  # mandatory, should always be before any django app
                  'delegaciones',  # you must list the app where your tenant model resides in
                  'adra',

              ] + list_apps

TENANT_APPS = list_apps + [
    "adra",
]
# INSTALLED_APPS = list_apps
INSTALLED_APPS = list(SHARED_APPS) + [
    app for app in TENANT_APPS if app not in SHARED_APPS
]

MIDDLEWARE = [
    'django_tenants.middleware.main.TenantMainMiddleware',
    "django.middleware.cache.UpdateCacheMiddleware",
    "django.middleware.security.SecurityMiddleware",
    "whitenoise.middleware.WhiteNoiseMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "corsheaders.middleware.CorsMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
    "django.middleware.cache.FetchFromCacheMiddleware",
]

ROOT_URLCONF = "adra_project.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [os.path.join(BASE_DIR, 'adra/templates'), os.path.join(BASE_DIR, 'adra/templates', 'account')],
        # "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.request",
                "django.template.context_processors.debug",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
                "adra.context_processors.add_variable_to_context",
                "adra.context_processors.get_tenant_name",
            ],
            "loaders": [
                "django_tenants.template.loaders.filesystem.Loader",  # Must be first
                "django.template.loaders.filesystem.Loader",
                "django.template.loaders.app_directories.Loader",
            ],
        },
    },
]

WSGI_APPLICATION = "adra_project.wsgi.application"

REST_FRAMEWORK = {
    "DEFAULT_PAGINATION_CLASS": "rest_framework.pagination.PageNumberPagination",  # noqa
    "PAGE_SIZE": 20,
    "DEFAULT_AUTHENTICATION_CLASSES": (
        # 'rest_framework.authentication.TokenAuthentication',
        "rest_framework_simplejwt.authentication.JWTAuthentication",
    ),
    "DEFAULT_PERMISSION_CLASSES": (
        "rest_framework.permissions.IsAuthenticated",
    ),
}

# Password validation
# https://docs.djangoproject.com/en/3.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.MinimumLengthValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.CommonPasswordValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.NumericPasswordValidator",
    },
]

STATICFILES_FINDERS = [
    "django_tenants.staticfiles.finders.TenantFileSystemFinder",
    "django.contrib.staticfiles.finders.FileSystemFinder",
    "django.contrib.staticfiles.finders.AppDirectoriesFinder",
]

MULTITENANT_STATICFILES_DIRS = [
    os.path.join(BASE_DIR, "adra/tenants/%s/static"),
]

MULTITENANT_TEMPLATE_DIRS = [
    # "absolute/path/to/your_project_dir/tenants/%s/templates"
    os.path.join(BASE_DIR, "adra/tenants/%s/templates"),
]

STATICFILES_STORAGE = "django_tenants.staticfiles.storage.TenantStaticFilesStorage"

MULTITENANT_RELATIVE_STATIC_ROOT = ""  # (default: create sub-directory for each tenant)

AUTHENTICATION_BACKENDS = (
    "django.contrib.auth.backends.ModelBackend",
    "allauth.account.auth_backends.AuthenticationBackend",
)

ACCOUNT_SESSION_REMEMBER = True
ACCOUNT_USERNAME_REQUIRED = False
ACCOUNT_AUTHENTICATION_METHOD = "email"
ACCOUNT_EMAIL_REQUIRED = True
ACCOUNT_UNIQUE_EMAIL = True

# Internationalization
# https://docs.djangoproject.com/en/3.0/topics/i18n/

# LANGUAGE_CODE = 'en-us'
LANGUAGE_CODE = "es"

TIME_ZONE = "Europe/Madrid"

USE_I18N = True

USE_L10N = True

USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.0/howto/static-files/

CRISPY_TEMPLATE_PACK = "bootstrap4"
LOGIN_REDIRECT_URL = "adra:persona-home"
ACCOUNT_LOGOUT_REDIRECT = "adra:persona-home"  # new

# PROJECT_ROOT = os.path.abspath(os.path.dirname(__file__))
# print(PROJECT_ROOT)
STATICFILES_DIRS = (os.path.join(BASE_DIR, "static"),)

DEFAULT_FROM_EMAIL = os.environ.get("DEFAULT_EMAIL")
ACCOUNT_EMAIL_CONFIRMATION_EXPIRE_DAYS = 1
ACCOUNT_EMAIL_VERIFICATION = "mandatory"
ACCOUNT_LOGIN_ATTEMPTS_LIMIT = 5
ACCOUNT_LOGIN_ATTEMPTS_TIMEOUT = 86400  # 1 day in seconds
ACCOUNT_LOGOUT_REDIRECT_URL = "/accounts/login/"
ACCOUNT_LOGOUT_ON_GET = True
ACCOUNT_SIGNUP_FORM_CLASS = "adra.forms.SignupForm"
ACCOUNT_ADAPTER = "adra.views.CustomAllauthAdapter"

# chache page
CACHES = {
    "default": {
        "BACKEND": "django.core.cache.backends.memcached.MemcachedCache",
        "LOCATION": "cache_table",
    }
}

CACHE_MIDDLEWARE_ALIAS = "default"
CACHE_MIDDLEWARE_SECONDS = 600  # una semana
CACHE_MIDDLEWARE_KEY_PREFIX = ""

MEDIA_URL = "/media/"
MEDIA_ROOT = os.path.join(BASE_DIR, "media/")

CORS_ALLOWED_ORIGINS = [
    # "http://localhost:8080",
    "http://127.0.0.1:8080",
    "https://adra-django-static.s3.amazonaws.com",
]
CORS_ALLOW_METHODS = ("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS")

# CELERY_BROKER_URL = str(os.getenv("REDIS_URL"))
CELERY_BROKER_URL = "redis://redis:6379"
CELERY_RESULT_BACKEND = "redis://redis:6379"

CELERY_USER = str(os.getenv("CELERY_USER"))
CELERY_USER_PASSWORD = str(os.getenv("CELERY_PASSWORD"))
TELEGRAM_TOKEN_KEY = str(os.getenv("TELEGRAM_TOKEN"))

PLATFORM_NAME = "Adra Torrejon"

LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "loggers": {
        "": {
            "level": "DEBUG",
            # 'handlers': ['console', 'file'],
            "handlers": ["console"],
            "propagate": True,
        }
    },
    # 'filters': {
    #     'tenant_context': {
    #         '()': 'django_tenants.log.TenantContextFilter'
    #     },
    # },
    "formatters": {
        "console": {
            "format": "%(asctime)s  %(name)-12s %(levelname)-8s %(message)s"
        },
        # 'tenant_context': {
        #     'format': '[%(schema_name)s:%(domain_url)s] '
        #               '%(levelname)-7s %(asctime)s %(message)s',
        # },
        # 'file': {
        #     'format': '%(asctime)s  %(name)-12s %(levelname)-8s %(message)s'
        # }
    },
    "handlers": {
        "console": {
            "class": "logging.StreamHandler",
            "formatter": "console",
            # "filters": ['tenant_context']
        }
    }
}

# para cuando tengo por fin https
# SESSION_COOKIE_SECURE = True
# CSRF_COOKIE_SECURE = True
DEFAULT_AUTO_FIELD = "django.db.models.AutoField"

TENANT_MODEL = 'delegaciones.Delegaciones'
TENANT_DOMAIN_MODEL = "delegaciones.Domain"  # app.Model
PUBLIC_SCHEMA_URLCONF = 'delegaciones.urls'
JSIGNATURE_WIDTH = '100%'
JSIGNATURE_HEIGHT = 200

SENDGRID_API_KEY = os.environ.get("SENDGRID_API_KEY")
SENDGRID_ALIMENTOS_TEMPLATE_ID = os.environ.get("SENDGRID_ALIMENTOS_TEMPLATE_ID")
