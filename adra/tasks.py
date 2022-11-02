from datetime import datetime

import sendgrid
from adra_project.celery import app
from celery.schedules import crontab
from celery.utils.log import get_task_logger
from django.conf import settings
from django.contrib.auth.models import User
from django_tenants.utils import get_tenant_model, tenant_context

from adra.models import AlmacenAlimentos

logger = get_task_logger(__name__)


def send_email_sendgrid(
    producto: str, email_lst: list, tenant_info, subject_msg
) -> int:
    message = sendgrid.Mail(
        from_email="admin@adra.es",
        subject="Caducidad de alimentos",
        to_emails=email_lst,
    )
    message.dynamic_template_data = {
        "producto": producto,
        "mensaje": subject_msg,
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


@app.on_after_finalize.connect
def setup_periodic_tasks(**kwargs):
    # Executes every day  at 8 am
    app.add_periodic_task(
        crontab(minute=0, hour="8"),
        # crontab(),
        check_caducidad_todas_delegaciones,
        name="comprobar las caducidades de los alimentos",
    )

@app.task(bind=True)
def check_caducidad_todas_delegaciones():
    for tenant in get_tenant_model().objects.exclude(schema_name="public"):
        with tenant_context(tenant):

            emails = User.objects.filter(
                is_active=True, is_staff=True
            ).values_list("email", flat=True)

            list_email = [email for email in emails]
            print(tenant)
            print(list_email)

            for number in range(1, 13):
                producto, days = AlmacenAlimentos.caducidad(
                    AlmacenAlimentos, number
                )
                print(producto, days)
                if days in [37, 10, 0]:
                    if days == 0:
                        send_email_sendgrid(
                            producto, list_email, tenant, "ha caducado"
                        )
                        return "tarea executada correctamente"

                    send_email_sendgrid(
                        producto,
                        list_email,
                        tenant,
                        f"va a caducar pronto,quedan {days} dias",
                    )
                    return "tarea executada correctamente"
