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
                    fields = alimentos._meta.get_fields()
                    field_almacen = [
                        "alimento_1",
                        "alimento_2",
                        "alimento_3",
                        "alimento_4",
                        "alimento_5",
                        "alimento_6",
                        "alimento_7",
                        "alimento_8",
                        "alimento_9",
                        "alimento_10",
                        "alimento_11",
                        "alimento_12",
                        "alimento_13",
                    ]

                    almacen_alimentos_lst = []
                    for field in fields:
                        print(field.name)
                        if field.name in field_almacen:
                            value = getattr(alimentos, field.name)
                            print(field.verbose_name.title())
                            print(value)
                            almacen_alimentos_lst.append({
                                "name": field.verbose_name.title(),
                                "quantity": value
                            })

                    oar_info["almacen_stock"] = almacen_alimentos_lst

                    beneficiar = Persona.objects.filter(active=True).exclude(covid=True)

                    familiares = Hijo.objects.filter(
                        persona__in=Persona.objects.filter(active=True).exclude(covid=True)
                    )

                    ages = AgeCalculacion(beneficiar, familiares).calculate_age()
                    from django.core import serializers
                    # data = serializers.serialize('json', alimentos)
                    from django.forms.models import model_to_dict
                    oar_info["edades"] = ages
                    # oar_info["almacen_alimentos"] = model_to_dict(alimentos)

                    # print(ages)
        print(oar_info)
        return JsonResponse(oar_info)
