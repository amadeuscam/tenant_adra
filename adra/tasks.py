from datetime import datetime
import sendgrid
from django.conf import settings
from celery.schedules import crontab
from celery.utils.log import get_task_logger
from django.contrib.auth.models import User

from adra.models import AlmacenAlimentos
from adra_project.celery import app
from adra.api_consume.get_api_data import get_caducidades
from django_tenants.utils import get_tenant_model, tenant_context

logger = get_task_logger(__name__)


def send_email_sendgrid(producto: str, email_lst: list, tenant_info) -> int:
    message = sendgrid.Mail(
        from_email="admin@adra.es",
        subject=f"El {producto} va a caducar pronto",
        to_emails=email_lst,
    )
    message.dynamic_template_data = {
        "alimento": f"{producto}",
        "Sender_Name": f"{tenant_info.nombre}",
        "Sender_Address": f"{tenant_info.calle}",
        "Sender_City": f"{tenant_info.ciudad}",
        "Sender_State": f"{tenant_info.provincia}",
        "Sender_Zip": f"{tenant_info.codigo_postal}",
    }
    message.template_id = str(settings.SENDGRID_ALIMENTOS_TEMPLATE_ID)

    try:
        sg = sendgrid.SendGridAPIClient(settings.SENDGRID_API_KEY)
        response = sg.send(message)
        return response.status_code
        # print(response.status_code)
        # print(response.body)
        # print(response.headers)
    except Exception as e:
        print(e.message)


app.conf.beat_schedule = {
    'add-every-30-seconds': {
        'task': 'check_caducidad_todas_delegaciones',
        # 'schedule': crontab(minute=30, hour='7'),
        'schedule': crontab(),
    },
    # 'restart_telefram': {
    #     'task': 'restart_telefram_bot',
    #     # 'schedule': crontab(minute=0, hour='6,18'),
    #     'schedule': crontab(),
    # },
    # 'database_backup': {
    #     'task': 'make_backup_database',
    #     # 'schedule': crontab(minute=0, hour='6,18'),
    #     'schedule': crontab(),
    # },
}


@app.task(name='check_caducidad_todas_delegaciones')
def check_caducidad_todas_delegaciones():
    for tenant in get_tenant_model().objects.exclude(schema_name='public'):
        with tenant_context(tenant):
            emails = User.objects.filter(is_active=True, is_staff=True).values_list('email', flat=True)
            list_email = [e for e in emails]
            print(tenant)
            print(list_email)

            for count in range(1, 13):
                name, days = AlmacenAlimentos.caducidad(AlmacenAlimentos, count)
                print(name, days)
                if days == 37:
                    send_email_sendgrid(name, ["amadeuscam@yahoo.es"], tenant)
                    return "tarea executada correctamente"
