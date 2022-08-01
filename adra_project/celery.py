import os
from celery import Celery
from django.conf import settings
from tenant_schemas_celery.app import CeleryApp as TenantAwareCeleryApp

os.environ.get('DJANGO_SETTINGS_MODULE', 'adra_project.settings.dev')
# os.environ.setdefault('FORKED_BY_MULTIPROCESSING', '1')
# 'adra_project'
app = TenantAwareCeleryApp()
app.config_from_object('django.conf:settings', namespace='CELERY')
app.autodiscover_tasks(lambda: settings.INSTALLED_APPS)
app.conf.timezone = 'Europe/Madrid'

# app.config_from_object(settings, namespace='CELERY')
# app.autodiscover_tasks()
