import requests
import json
from django.conf import settings
from django.contrib.sites.models import Site


def get_token(name: str, password: str):

    url = f'{Site.objects.get_current()}api/token/'
    data = {"username": f"{name}", "password": f"{password}"}
    data_res = requests.post(url, data)
    return json.loads(data_res.content.decode('utf-8'))


def get_caducidades(endpoints: list) -> dict:
    token = get_token(settings.CELERY_USER, settings.CELERY_USER_PASSWORD)
    headers = {'Authorization': f"Bearer {token['access']}", 'Content-Type': 'application/json'}

    data_ret = {}

    for endpoint in endpoints:
        url = f'{Site.objects.get_current()}api/{endpoint}/'
        data_res = requests.get(url, headers=headers)
        data = json.loads(data_res.content.decode('utf-8'))
        data_ret[endpoint] = data['results']

    return data_ret
