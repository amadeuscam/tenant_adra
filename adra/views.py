import io
import os
from datetime import date
from xml.dom import VALIDATION_ERR

import telegram
from allauth.account.adapter import DefaultAccountAdapter
from delegaciones.models import BeneficiariosGlobales
from django.conf import settings
from django.contrib import messages
from django.contrib.auth import get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.db import connection
from django.db.models import Q, Sum
from django.http import HttpResponse, JsonResponse
from django.shortcuts import get_object_or_404, redirect, render
from django.urls import reverse_lazy
from django.views.decorators.cache import cache_page
from django.views.generic import (CreateView, DeleteView, DetailView, ListView,
                                  UpdateView)
from django_tenants.utils import get_tenant_model
from jsignature.utils import draw_signature
from mailmerge import MailMerge
from openpyxl import Workbook
from openpyxl.styles import Alignment, PatternFill
from PyPDF2 import PdfFileReader, PdfFileWriter
from PyPDF2.generic import (BooleanObject, IndirectObject, NameObject,
                            NumberObject)
from reportlab.pdfgen import canvas
from rest_framework import permissions, viewsets
from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail

from adra.utils.adra_util import AdraUtils, DeliverySheet, ValoracionSocial

from .filters import AlimentosFilters
from .forms import (AlimentosFrom, HijoForm, PersonaForm, ProfileEditForm,
                    UserEditForm)
from .models import Alimentos, AlmacenAlimentos, Hijo, Persona
from .serializers import (AlacenAlimentosSerializer, PersonaSerializer,
                          UserSerializer)


def anuncios(request):
    return render(request, "adra/anuncio.html")


@login_required
def edit(request):
    if request.method == "POST":
        user_form = UserEditForm(instance=request.user, data=request.POST)
        profile_form = ProfileEditForm(
            instance=request.user.profile,
            data=request.POST,
            files=request.FILES,
        )
        if user_form.is_valid() and profile_form.is_valid():
            user_form.save()
            profile_form.save()
            messages.success(
                request, "El perfil se ha actualizado correctamente"
            )
            return redirect("adra:edit-profile")
        else:
            messages.error(request, "Error updating your profile")
    else:
        user_form = UserEditForm(instance=request.user)
        profile_form = ProfileEditForm(instance=request.user.profile)
    return render(
        request,
        "account/edit-perfile.html",
        {"user_form": user_form, "profile_form": profile_form},
    )


class PersonaListView(LoginRequiredMixin, ListView):
    template_name = "adra/index.html"
    context_object_name = "ultima_persona"
    model = Persona
    login_url = "account_login"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # enviar al misma pagina varios contextos
        context["hijo"] = Hijo.objects
        context["hijomenor"] = Hijo
        context["nbar"] = "home"
        context["debug"] = settings.DEBUG
        context["platform_name"] = settings.PLATFORM_NAME

        return context


# ir a la pagina detallada de cada persona
class PersonaDetailView(LoginRequiredMixin, DetailView):
    model = Persona
    template_name = "adra/detail.html"
    context_object_name = "persona"
    login_url = "account_login"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["filter"] = AlimentosFilters(
            self.request.GET, queryset=self.get_queryset()
        )
        return context


class BuscarDetailView(LoginRequiredMixin, ListView):
    model = Alimentos
    template_name = "busqueda_a/view.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["filter"] = AlimentosFilters(
            self.request.GET, queryset=self.get_queryset()
        )
        return context


class PersonaCreateView(LoginRequiredMixin, CreateView):
    model = Persona
    success_url = "/"
    form_class = PersonaForm

    def form_valid(self, form):
        print(form.cleaned_data)
        logic = Q(
            documentacion_beneficiario=form.cleaned_data["dni"]
            if form.cleaned_data["dni"]
            else form.cleaned_data["otros_documentos"],
            telefono=form.cleaned_data["telefono"],
            # nombre_beneficiario=form.cleaned_data["nombre_apellido"],
            _connector=Q.OR,
        )
        beneficario_global = BeneficiariosGlobales.objects.filter(
            logic,nombre_beneficiario=form.cleaned_data["nombre_apellido"]
        )
        print(beneficario_global)
        print(beneficario_global.count())

        if beneficario_global.count() > 0:

            for beneficario in beneficario_global:
                print(beneficario.delegacion_name)

                messages.warning(
                    self.request,
                    "{} es beneficiario de la oar {} desde {}".format(
                        beneficario.nombre_beneficiario,
                        beneficario.delegacion_name,
                        beneficario.created_at.strftime("%d %B, %Y"),

                    ),
                )
            return super().form_invalid(form)
        else:
            form.instance.modificado_por = self.request.user
            messages.add_message(
                self.request,
                messages.SUCCESS,
                "Beneficiario añadido con exito!",
            )
            return super().form_valid(form)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["nbar"] = "create"

        try:
            p = Persona.objects.latest("created_at")
            context["bas"] = p
        except Persona.DoesNotExist:
            context["bas"] = None

        return context


class PersonaUpdateView(LoginRequiredMixin, SuccessMessageMixin, UpdateView):
    model = Persona
    form_class = PersonaForm

    success_message = "Datele sau salvat cu success!!"

    def form_valid(self, form):
        form.instance.modificado_por = self.request.user
        return super().form_valid(form)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["up"] = "update"
        return context


class PersonaDeleteView(LoginRequiredMixin, SuccessMessageMixin, DeleteView):
    model = Persona
    success_message = "Beneficirio borrado corectamente"
    success_url = "/"


def adauga_alimentos_persona(request, pk):
    persona = get_object_or_404(Persona, pk=pk)
    almacen = AlmacenAlimentos.objects.get(pk=1)

    if request.method == "POST":
        a_form = AlimentosFrom(request.POST)
        if a_form.is_valid():
            alimentos = a_form.save(commit=False)
            signature = a_form.cleaned_data.get("signature")
            if signature:
                # as an image
                signature_picture = draw_signature(signature)

            almacen.alimento_1 -= alimentos.alimento_1
            almacen.alimento_2 -= alimentos.alimento_2
            almacen.alimento_3 -= alimentos.alimento_3
            almacen.alimento_4 -= alimentos.alimento_4
            almacen.alimento_5 -= alimentos.alimento_5
            almacen.alimento_6 -= alimentos.alimento_6
            almacen.alimento_7 -= alimentos.alimento_7
            almacen.alimento_8 -= alimentos.alimento_8
            almacen.alimento_9 -= alimentos.alimento_9
            almacen.alimento_10 -= alimentos.alimento_10
            almacen.alimento_11 -= alimentos.alimento_11
            almacen.alimento_12 -= alimentos.alimento_12
            almacen.alimento_13 -= alimentos.alimento_13

            alimentos.persona = persona
            alimentos.modificado_por = request.user
            almacen.save()
            alimentos.save()
            messages.success(
                request, "Los alimentos se han entregado correctamente!"
            )
            return redirect(persona)

    else:
        a_form = AlimentosFrom()
    return render(request, "adra/alimentos_form.html", {"form": a_form})


class PersonaAlimentosUpdateView(LoginRequiredMixin, UpdateView):
    model = Alimentos
    fields = [
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
        "fecha_recogida",
        "signature",
    ]

    def form_valid(self, form):
        clean = form.changed_data
        almacen = AlmacenAlimentos.objects.get(pk=1)

        if "alimento_1" in clean:
            valor_anterior_alimento_1 = form.initial["alimento_1"]
            if form.instance.alimento_1 > valor_anterior_alimento_1:
                restante = abs(
                    form.instance.alimento_1 - valor_anterior_alimento_1
                )
                almacen.alimento_1 -= restante
            else:
                restante = abs(
                    form.instance.alimento_1 - valor_anterior_alimento_1
                )
                almacen.alimento_1 += restante

        if "alimento_2" in clean:
            valor_anterior_alimento_2 = form.initial["alimento_2"]
            if form.instance.alimento_2 > valor_anterior_alimento_2:
                restante = abs(
                    form.instance.alimento_2 - valor_anterior_alimento_2
                )
                almacen.alimento_2 -= restante
            else:
                restante = abs(
                    form.instance.alimento_2 - valor_anterior_alimento_2
                )
                almacen.alimento_2 += restante

        if "alimento_3" in clean:
            valor_anterior_alimento_3 = form.initial["alimento_3"]
            if form.instance.alimento_3 > valor_anterior_alimento_3:
                restante = abs(
                    form.instance.alimento_3 - valor_anterior_alimento_3
                )
                almacen.alimento_3 -= restante
            else:
                restante = abs(
                    form.instance.alimento_3 - valor_anterior_alimento_3
                )
                almacen.alimento_3 += restante

        if "alimento_4" in clean:
            valor_anterior_alimento_4 = form.initial["alimento_4"]
            if form.instance.alimento_4 > valor_anterior_alimento_4:
                restante = abs(
                    form.instance.alimento_4 - valor_anterior_alimento_4
                )
                almacen.alimento_4 -= restante
            else:
                restante = abs(
                    form.instance.alimento_4 - valor_anterior_alimento_4
                )
                almacen.alimento_4 += restante

        if "alimento_5" in clean:
            valor_anterior_alimento_5 = form.initial["alimento_5"]
            if form.instance.alimento_5 > valor_anterior_alimento_5:
                restante = abs(
                    form.instance.alimento_5 - valor_anterior_alimento_5
                )
                almacen.alimento_5 -= restante
            else:
                restante = abs(
                    form.instance.alimento_5 - valor_anterior_alimento_5
                )
                almacen.alimento_5 += restante

        if "alimento_6" in clean:
            valor_anterior_alimento_6 = form.initial["alimento_6"]
            if form.instance.alimento_6 > valor_anterior_alimento_6:
                restante = abs(
                    form.instance.alimento_6 - valor_anterior_alimento_6
                )
                almacen.alimento_6 -= restante
            else:
                restante = abs(
                    form.instance.alimento_6 - valor_anterior_alimento_6
                )
                almacen.alimento_6 += restante

        if "alimento_7" in clean:
            valor_anterior_alimento_7 = form.initial["alimento_7"]
            if form.instance.alimento_7 > valor_anterior_alimento_7:
                restante = abs(
                    form.instance.alimento_7 - valor_anterior_alimento_7
                )
                almacen.alimento_7 -= restante
            else:
                restante = abs(
                    form.instance.alimento_7 - valor_anterior_alimento_7
                )
                almacen.alimento_7 += restante

        if "alimento_8" in clean:
            valor_anterior_alimento_8 = form.initial["alimento_8"]
            if form.instance.alimento_8 > valor_anterior_alimento_8:
                restante = abs(
                    form.instance.alimento_8 - valor_anterior_alimento_8
                )
                almacen.alimento_8 -= restante
            else:
                restante = abs(
                    form.instance.alimento_8 - valor_anterior_alimento_8
                )
                almacen.alimento_8 += restante

        if "alimento_9" in clean:
            valor_anterior_alimento_9 = form.initial["alimento_9"]
            if form.instance.alimento_9 > valor_anterior_alimento_9:
                restante = abs(
                    form.instance.alimento_9 - valor_anterior_alimento_9
                )
                almacen.alimento_9 -= restante
            else:
                restante = abs(
                    form.instance.alimento_9 - valor_anterior_alimento_9
                )
                almacen.alimento_9 += restante

        if "alimento_10" in clean:
            valor_anterior_alimento_10 = form.initial["alimento_10"]
            if form.instance.alimento_10 > valor_anterior_alimento_10:
                restante = abs(
                    form.instance.alimento_10 - valor_anterior_alimento_10
                )
                almacen.alimento_10 -= restante
            else:
                restante = abs(
                    form.instance.alimento_10 - valor_anterior_alimento_10
                )
                almacen.alimento_10 += restante

        if "alimento_11" in clean:
            valor_anterior_alimento_11 = form.initial["alimento_11"]
            if form.instance.alimento_11 > valor_anterior_alimento_11:
                restante = abs(
                    form.instance.alimento_11 - valor_anterior_alimento_11
                )
                almacen.alimento_11 -= restante
            else:
                restante = abs(
                    form.instance.alimento_11 - valor_anterior_alimento_11
                )
                almacen.alimento_11 += restante

        if "alimento_12" in clean:
            valor_anterior_alimento_12 = form.initial["alimento_12"]
            if form.instance.alimento_12 > valor_anterior_alimento_12:
                restante = abs(
                    form.instance.alimento_12 - valor_anterior_alimento_12
                )
                almacen.alimento_12 -= restante
            else:
                restante = abs(
                    form.instance.alimento_12 - valor_anterior_alimento_12
                )
                almacen.alimento_12 += restante

        if "alimento_13" in clean:
            valor_anterior_alimento_13 = form.initial["alimento_13"]
            if form.instance.alimento_13 > valor_anterior_alimento_13:
                restante = abs(
                    form.instance.alimento_13 - valor_anterior_alimento_13
                )
                almacen.alimento_13 -= restante
            else:
                restante = abs(
                    form.instance.alimento_13 - valor_anterior_alimento_13
                )
                almacen.alimento_13 += restante

        almacen.save()
        form.instance.modificado_por = self.request.user
        return super().form_valid(form)


class PersonaAlimentosDeleteView(LoginRequiredMixin, DeleteView):
    model = Alimentos
    success_url = "/"

    def test_func(self):
        persona = self.get_object()
        if self.request.user == persona.modificado_por:
            return True
        return False


class AlmacenListView(LoginRequiredMixin, ListView):
    model = AlmacenAlimentos
    template_name = "adra_almacen/index.html"
    context_object_name = "almacen_adra"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["nbar"] = "almacen_a"
        return context


class HijoCreateView(LoginRequiredMixin, CreateView):
    model = Hijo
    form_class = HijoForm

    def form_valid(self, form):
        form.instance.modificado_por = self.request.user
        return super().form_valid(form)


def adauga_hijo_persona(request, pk):
    persona = get_object_or_404(Persona, pk=pk)
    if request.method == "POST":
        h_form = HijoForm(request.POST)
        if h_form.is_valid():
            hijo = h_form.save(commit=False)
            hijo.persona = persona
            hijo.modificado_por = request.user
            hijo.save()
            return redirect(persona)

    else:
        h_form = HijoForm()
    return render(request, "adra/hijo_form.html", {"form": h_form})


class HijoUpdateView(LoginRequiredMixin, UpdateView):
    model = Hijo
    form_class = HijoForm

    def form_valid(self, form):
        form.instance.modificado_por = self.request.user
        return super().form_valid(form)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["up"] = "update"
        return context


class HijoDeleteView(LoginRequiredMixin, DeleteView):
    model = Hijo
    persoan = Persona
    # success_url = reverse_lazy("adra:persona-home")

    def get_success_url(self):

        return reverse_lazy(
            "adra:personas_detail", kwargs={"pk": self.object.persona.pk}
        )


@login_required
def buscar(request):
    if "q" in request.GET and request.GET["q"]:
        q = request.GET["q"]

        if q.isdigit():
            ultima_persona = Persona.objects.filter(
                Q(numero_adra=q) | Q(telefono=q)
            ).filter(active=True)
        else:
            ultima_persona = Persona.objects.filter(
                nombre_apellido__icontains=q
            ).filter(active=True)
        if ultima_persona:
            return render(
                request,
                "adra/index.html",
                {"ultima_persona": ultima_persona, "query": q},
            )
        else:
            beneficiarios_no_activos = Persona.objects.filter(
                active=False
            ).order_by("-numero_adra")
            return render(
                request,
                "adra/no_beneficiarios.html",
                {"ben": beneficiarios_no_activos},
            )
    else:
        return HttpResponse("<h1>Por favor buscar con otro criterio</h1>")


def calculate_age(age):
    today = date.today()
    return (
        today.year
        - age.year
        - ((today.month, today.day) < (age.month, age.day))
    )


def age_range(min_age, max_age, model, extra_filter: dict):
    current = date.today()
    min_date = date(current.year - min_age, current.month, current.day)
    max_date = date(current.year - max_age, current.month, current.day)

    return model.filter(
        fecha_nacimiento__gte=max_date,
        fecha_nacimiento__lte=min_date,
        **extra_filter,
    )


@login_required
def statistics_persona(request):
    # mod = 2
    # if request.POST:
    #     if request.POST.get("mod", None):
    #         mod = request.POST.get("mod", None)

    # if int(mod) == 1:
    #     # .prefetch_related("hijo")
    #     beneficiar = Persona.objects.filter(active=True).exclude(covid=True)
    # else:

    beneficiar = Persona.objects.filter(active=True).exclude(covid=True)

    familiares = Hijo.objects.filter(
        persona__in=Persona.objects.filter(active=True).exclude(covid=True)
    )

    ben_0_2_m = age_range(0, 3, beneficiar, {"sexo": "mujer"}).count()
    ben_0_2_h = age_range(0, 3, beneficiar, {"sexo": "hombre"}).count()
    ben_3_15_m = age_range(3, 16, beneficiar, {"sexo": "mujer"}).count()
    ben_3_15_h = age_range(3, 16, beneficiar, {"sexo": "hombre"}).count()
    ben_16_64_m = age_range(16, 65, beneficiar, {"sexo": "mujer"}).count()
    ben_16_64_h = age_range(16, 65, beneficiar, {"sexo": "hombre"}).count()
    ben_65_100_m = age_range(65, 100, beneficiar, {"sexo": "mujer"}).count()
    ben_65_100_h = age_range(65, 100, beneficiar, {"sexo": "hombre"}).count()

    fam_0_2_m = age_range(0, 3, familiares, {"sexo": "m"}).count()
    fam_0_2_h = age_range(0, 3, familiares, {"sexo": "h"}).count()
    fam_3_15_m = age_range(3, 16, familiares, {"sexo": "m"}).count()
    fam_3_15_h = age_range(3, 16, familiares, {"sexo": "h"}).count()
    fam_16_64_m = age_range(16, 65, familiares, {"sexo": "m"}).count()
    fam_16_64_h = age_range(16, 65, familiares, {"sexo": "h"}).count()
    fam_65_100_m = age_range(65, 100, familiares, {"sexo": "m"}).count()
    fam_65_100_h = age_range(65, 100, familiares, {"sexo": "h"}).count()

    total_mujer_02 = ben_0_2_m + fam_0_2_m
    total_mujer_3_15 = ben_3_15_m + fam_3_15_m
    total_mujer_16_64 = ben_16_64_m + fam_16_64_m
    total_mujer_65_gt = ben_65_100_m + fam_65_100_m
    total_mujeres = (
        total_mujer_02
        + total_mujer_3_15
        + total_mujer_16_64
        + total_mujer_65_gt
    )

    total_hombres_02 = ben_0_2_h + fam_0_2_h
    total_hombres_3_15 = ben_3_15_h + fam_3_15_h
    total_hombres_16_64 = ben_16_64_h + fam_16_64_h
    total_hombres_65_gt = ben_65_100_h + fam_65_100_h
    total_hombres = (
        total_hombres_02
        + total_hombres_3_15
        + total_hombres_16_64
        + total_hombres_65_gt
    )

    ben_descapacitados = Persona.objects.filter(
        discapacidad=True, active=True
    ).count()

    fam_descapacitados = familiares.filter(
        discapacidad=True, active=True
    ).count()

    data_statistics = {
        "total_per_mujer_02": total_mujer_02,
        "total_per_mujer_03": total_mujer_3_15,
        "total_per_mujer_16": total_mujer_16_64,
        "total_per_mujer_65": total_mujer_65_gt,
        "total_mujeres": total_mujeres,
        "total_per_hombre_02": total_hombres_02,
        "total_per_hombre_03": total_hombres_3_15,
        "total_per_hombre_16": total_hombres_16_64,
        "total_per_hombre_65": total_hombres_65_gt,
        "total_hombres": total_hombres,
        "total_02": total_mujer_02 + total_hombres_02,
        "total_03": total_mujer_3_15 + total_hombres_3_15,
        "total_16": total_mujer_16_64 + total_hombres_16_64,
        "total_65": total_mujer_65_gt + total_hombres_65_gt,
        "total_personas": total_mujeres + total_hombres,
        "discapacidad": ben_descapacitados + fam_descapacitados,
        "total_beneficiarios": beneficiar.count(),
        "total_familiares": familiares.count(),
        "nbar": "stat",
    }

    return render(request, "statistics/index.html", data_statistics)


def telegram_messages(request):
    """
    Es encargado de mandar mensajes al grupo de telegram

    Args:
        request (request): se recibice el mensaje y el grupo de personas

    Returns:
        HttpResponse
    """

    if request.method == "POST":
        dom = str(request.POST.get("dom_select"))
        mensaje_propio = request.POST.get("mensaje_propio")
        if dom and mensaje_propio:
            bot = telegram.Bot(token=str(os.getenv("TELEGRAM_TOKEN")))
            persona = None

            if dom == "todos":
                persona = Persona.objects.filter(active=True).exclude(
                    covid=True
                )
            else:
                persona = (
                    Persona.objects.filter(active=True)
                    .filter(
                        Q(categoria=f"Domingo {int(dom)}")
                        | Q(categoria=int(dom)),
                        ciudad__icontains="Torrejon de ardoz",
                    )
                    .exclude(covid=True)
                )

            per_list = [p.nombre_apellido for p in persona]
            list_format = "\n".join(per_list)

            bot.send_message(
                str(os.getenv("TELEGRAM_CANAL")),
                f"*{list_format}*",
                parse_mode=telegram.ParseMode.MARKDOWN_V2,
            )
            bot.send_message(
                str(os.getenv("TELEGRAM_CANAL")),
                f"*{mensaje_propio}*",
                parse_mode=telegram.ParseMode.MARKDOWN_V2,
            )

            messages.success(request, "El mensaje se ha mandado correctamente")
            return render(request, "telegram/index.html", {"nbar": "tel"})
    else:
        return render(request, "telegram/index.html", {"nbar": "tel"})


def export_users_csv(request):
    beneficiarios_queryset = Persona.objects.order_by("numero_adra").filter(
        active=True
    )

    response = HttpResponse(
        content_type="application/vnd.openxmlformats-officedocument.\
            spreadsheetml.sheet",
    )
    response["Content-Disposition"] = "attachment; filename=beneficiarios.xlsx"
    workbook = Workbook()

    # Get active worksheet/tab
    worksheet = workbook.active
    # Delete the default worksheet
    # workbook.remove(workbook.active)
    worksheet.title = "Beneficiarios"
    # Define the titles for columns
    worksheet.column_dimensions["B"].width = 40
    worksheet.column_dimensions["C"].width = 40
    worksheet.column_dimensions["C"].width = 30
    worksheet.column_dimensions["E"].width = 40
    columns = [
        "Numar adra",
        "Nombre",
        "Representante familiar",
        "Dni",
        "Pasaporte",
        "Fecha de nacimiento",
    ]
    row_num = 1
    fill = PatternFill(start_color="43fb32", fill_type="solid")
    # Assign the titles for each cell of the header
    for col_num, column_title in enumerate(columns, 1):
        cell = worksheet.cell(row=row_num, column=col_num)
        cell.value = column_title
    count = 0
    for ben in beneficiarios_queryset:
        row_num += 1
        count += 1

        # Define the data for each cell in the row
        row = [
            f"{count}-{ben.numero_adra}",
            ben.nombre_apellido,
            1,
            ben.dni,
            ben.otros_documentos,
            ben.fecha_nacimiento.strftime("%d/%m/%Y"),
        ]
        # Assign the data for each cell of the row
        for col_num, cell_value in enumerate(row, 1):
            cell = worksheet.cell(row=row_num, column=col_num)
            cell.value = cell_value
            cell.fill = fill
            cell.alignment = Alignment(horizontal="center")

        for d in ben.hijo.filter(active=True):
            count += 1
            row_hijos = [
                f"{count}",
                d.nombre_apellido,
                "",
                d.dni,
                d.otros_documentos,
                d.fecha_nacimiento.strftime("%d/%m/%Y"),
            ]
            row_num += 1

            # Assign the data for each cell of the row
            for col_num, cell_value in enumerate(row_hijos, 1):
                cell = worksheet.cell(row=row_num, column=col_num)
                cell.value = cell_value
                cell.alignment = Alignment(horizontal="center")

    workbook.save(response)

    return response


@login_required
@cache_page(60 * 15)
def buscar_fecha(request):
    alimentos_list = Alimentos.objects.all()
    user_filter = AlimentosFilters(request.GET, queryset=alimentos_list)

    alimento_1 = user_filter.qs.aggregate(Sum("alimento_1"))
    alimento_2 = user_filter.qs.aggregate(Sum("alimento_2"))
    alimento_3 = user_filter.qs.aggregate(Sum("alimento_3"))
    alimento_4 = user_filter.qs.aggregate(Sum("alimento_4"))
    alimento_5 = user_filter.qs.aggregate(Sum("alimento_5"))
    alimento_6 = user_filter.qs.aggregate(Sum("alimento_6"))
    alimento_7 = user_filter.qs.aggregate(Sum("alimento_7"))
    alimento_8 = user_filter.qs.aggregate(Sum("alimento_8"))
    alimento_9 = user_filter.qs.aggregate(Sum("alimento_9"))
    alimento_10 = user_filter.qs.aggregate(Sum("alimento_10"))
    alimento_11 = user_filter.qs.aggregate(Sum("alimento_11"))
    alimento_12 = user_filter.qs.aggregate(Sum("alimento_12"))
    alimento_13 = user_filter.qs.aggregate(Sum("alimento_13"))

    return render(
        request,
        "busqueda_a/view.html",
        {
            "filter": user_filter,
            "alimento_1": alimento_1,
            "alimento_2": alimento_2,
            "alimento_3": alimento_3,
            "alimento_4": alimento_4,
            "alimento_5": alimento_5,
            "alimento_6": alimento_6,
            "alimento_7": alimento_7,
            "alimento_8": alimento_8,
            "alimento_9": alimento_9,
            "alimento_10": alimento_10,
            "alimento_11": alimento_11,
            "alimento_12": alimento_12,
            "alimento_13": alimento_13,
            "nbar": "buscar_av",
        },
    )


def generar_hoja_entrega(request, pk, mode):
    """
    Generador de hoja de entrega para cada beneficiario en parte
    :param request:
    :param pk: id persona
    :return: pdf generado
    """
    print("mode generate->", mode)
    print(request.tenant)
    print(request.tenant.oar)
    tenant_info = request.tenant
    # raise
    persona = Persona.objects.get(id=pk)
    if mode == "sin":
        pdf = DeliverySheet(persona, tenant_info).export_template_pdf(
            f"{persona.numero_adra}"
        )
        response = HttpResponse(content_type="application/pdf")
        response[
            "Content-Disposition"
        ] = f'attachment;filename="{persona.numero_adra}.pdf"'
        pdf.write(response)
        return response

    alimentos = persona.alimentos.all().order_by("fecha_recogida")

    for arr in AdraUtils().split_list(alimentos, 7):
        DeliverySheet(persona, tenant_info).add_signature(arr)

    res = AdraUtils().zip_files("source_files/generated_pdfs", True)

    response = HttpResponse(res)
    response["Content-Type"] = "application/x-zip-compressed"
    response[
        "Content-Disposition"
    ] = f"attachment; filename={persona.numero_adra}.zip"

    return response


def generar_hoja_valoracion_social(request, pk):
    persona = Persona.objects.get(pk=pk, active=True)
    val = ValoracionSocial(persona).get_valoracion()

    response = HttpResponse(
        content_type="application/vnd.openxmlformats-officedocument.wordprocessingml.document"  # noqa
    )
    response[
        "Content-Disposition"
    ] = f"attachment; filename={persona.numero_adra}.docx"
    val.write(response)

    return response


class PersonaViewSet(viewsets.ModelViewSet):
    """
    This viewset automatically provides `list`, `create`, `retrieve`,
    `update` and `destroy` actions.
    """

    queryset = Persona.objects.all().order_by("-numero_adra")
    serializer_class = PersonaSerializer
    permission_classes = [permissions.IsAuthenticated]
    lookup_fields = ("numero_adra", "nombre_apellido")

    def get_queryset(self):
        numero_adra = self.request.query_params.get("numero_adra", None)
        nombre_apellido = self.request.query_params.get(
            "nombre_apellido", None
        )
        queryset = None
        if numero_adra is not None:
            queryset = Persona.objects.filter(numero_adra=numero_adra)
        if nombre_apellido is not None:
            queryset = Persona.objects.filter(
                nombre_apellido__icontains=nombre_apellido
            )
        else:
            queryset = Persona.objects.all().order_by("-numero_adra")
        return queryset

    # def perform_destroy(self, request, *args, **kwargs):
    #         try:
    #             instance = self.get_object()
    #             print(instance)
    #             self.perform_destroy(instance)
    #         except Http404:
    #             pass
    #         return Response(status=status.HTTP_204_NO_CONTENT)

    def perform_create(self, serializer):
        serializer.save(modificado_por=self.request.user)


class AlmacenViewSet(viewsets.ReadOnlyModelViewSet):
    """
    This viewset automatically provides `list`, `create`, `retrieve`,
    `update` and `destroy` actions.
    """

    queryset = AlmacenAlimentos.objects.all()
    serializer_class = AlacenAlimentosSerializer
    permission_classes = [permissions.IsAuthenticated]


class UserViewSet(viewsets.ModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """

    queryset = get_user_model().objects.filter(is_superuser=True)
    serializer_class = UserSerializer


def get_data(request):
    """ " manda datos a los graficos de echats"""
    count_altas = []
    years = Persona.objects.dates("created_at", "year").values_list(
        "created_at__year", flat=True
    )
    print(years)
    for year in years:
        count_altas.append(
            Persona.objects.filter(created_at__year=year).count()
        )

    return JsonResponse({"reg": count_altas, "years": list(years)})


# def get_beneficiarios_activos(request, number):
#     data = None

#     with connection.cursor() as cursor:
#         query = (
#             f"SELECT COUNT(*) as ben_activo from (SELECT COUNT(adra_alimentos.persona_id) as ben_activos"  # noqa
#             f" FROM `adra_alimentos`  GROUP BY adra_alimentos.persona_id HAVING "  # noqa
#             f"COUNT(adra_alimentos.persona_id) >= {number}) as td"
#         )

#         cursor.execute(query)
#         data = cursor.fetchone()[0]
#     return JsonResponse({"num": data})


class CustomAllauthAdapter(DefaultAccountAdapter):
    """
    Clase encargada de enviar emails custom
    """

    # def stash_verified_email(self, request, email):
    #     print(request)
    #     print(request.tenant.nombre)

    def send_mail(self, template_prefix, email, context):

        tenant_info = get_tenant_model().objects.get(
            schema_name=connection.get_schema()
        )

        if context.get("activate_url"):

            user = context.get("user")

            sg = SendGridAPIClient(settings.SENDGRID_API_KEY)
            message = Mail(
                from_email="admin@adra.es",
                subject="Activación de la cuenta",
                to_emails=f"{user.email}",
            )
            message.dynamic_template_data = {
                "activate_url": f"{context.get('activate_url')}",
                "user": f"{context.get('user')}",
                "Sender_Name": f"{tenant_info.nombre}",
                "Sender_Address": f"{tenant_info.calle}",
                "Sender_City": f"{tenant_info.ciudad}",
                "Sender_State": f"{tenant_info.provincia}",
                "Sender_Zip": f"{tenant_info.codigo_postal}",
            }
            message.template_id = "d-8dddee085b5e4479a28b7dace0adf686"
            sg.send(message)

        elif context.get("password_reset_url"):

            user = context.get("user")
            sg = SendGridAPIClient(settings.SENDGRID_API_KEY)
            message = Mail(
                from_email="admin@adra.es",
                subject="Cambio de contraseña",
                to_emails=f"{user.email}",
            )
            message.dynamic_template_data = {
                "url_cambiar": f"{context.get('password_reset_url')}",
                "user": f"{user}",
                "Sender_Name": f"{tenant_info.nombre}",
                "Sender_Address": f"{tenant_info.calle}",
                "Sender_City": f"{tenant_info.ciudad}",
                "Sender_State": f"{tenant_info.provincia}",
                "Sender_Zip": f"{tenant_info.codigo_postal}",
            }

            message.template_id = "d-ab0adafe4dd14cb4b9aba688b7200830"
            sg.send(message)


@login_required
def reset_papeles(request):
    persona = Persona.objects.all()
    if request.POST:
        print("cambiar el estado de los papeles")
        for p in persona:
            p.empadronamiento = False
            p.libro_familia = False
            p.fotocopia_dni = False
            p.prestaciones = False
            p.nomnia = False
            p.cert_negativo = False
            p.aquiler_hipoteca = False
            p.recibos = False
            p.are_acte = False
            p.save()
        messages.success(request, "La tarea se ha relizado correctamente ")

    return render(request, "acciones/index.html", {"nbar": "acciones"})
