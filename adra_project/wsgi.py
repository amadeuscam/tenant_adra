"""
WSGI config for adra_project project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/3.0/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

os.environ.get('DJANGO_SETTINGS_MODULE', 'adra_project.settings.dev')

application = get_wsgi_application()
