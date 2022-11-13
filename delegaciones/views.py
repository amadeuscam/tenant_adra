from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from django_tenants.utils import tenant_context

from adra.models import Alimentos, AlmacenAlimentos, Persona, Hijo
from adra.utils.adra_util import AgeCalculacion
from delegaciones.models import Delegaciones


@login_required
def home(request):
    centros = []
    for tenant in Delegaciones.objects.exclude(schema_name="public"):
        with tenant_context(tenant):
            centros.append({"nombre": tenant.oar, "code": tenant.code})
    return render(
        request,
        "delegaciones/index.html",
        context={"var": 123, "centros": centros},
    )


@login_required
def get_oar_info(request):
    if request.method == 'GET':

        tenant_code = request.GET.get("tenant_code")
        print(tenant_code)
        oar_info = {}
        for tenant in Delegaciones.objects.exclude(schema_name="public"):
            with tenant_context(tenant):
                print(tenant)
                print(tenant.code)
                if int(tenant_code) == int(tenant.code):
                    print("dentro")

                    alimentos = AlmacenAlimentos.objects.get(id=1)
                    beneficiar = Persona.objects.filter(active=True).exclude(covid=True)

                    familiares = Hijo.objects.filter(
                        persona__in=Persona.objects.filter(active=True).exclude(covid=True)
                    )

                    ages = AgeCalculacion(beneficiar, familiares).calculate_age()
                    from django.core import serializers
                    # data = serializers.serialize('json', alimentos)
                    from django.forms.models import model_to_dict
                    oar_info["edades"] = ages
                    oar_info["almacen_alimentos"] = model_to_dict(alimentos)

                    # print(ages)

        return JsonResponse(oar_info)
