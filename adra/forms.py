from django import forms
from .models import Persona, Alimentos, Hijo, Profile
from django.contrib.auth.models import User
from django.forms import ModelForm, DateInput, EmailInput, Form
from jsignature.forms import JSignatureField
from jsignature.widgets import JSignatureWidget


class AlimentosFrom(ModelForm):
    # signature = JSignatureField()

    class Meta:
        model = Alimentos
        fields = (
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
        )
        widgets = {
            "fecha_recogida": DateInput(attrs={"type": "datetime-local"}),
            "signature": JSignatureWidget(jsignature_attrs={'color': '#405e9d'}),
        }


class PersonaForm(ModelForm):
    class Meta:
        model = Persona
        fields = [
            "nombre_apellido",
            "dni",
            "fecha_nacimiento",
            "numero_adra",
            "nacionalidad",
            "domicilio",
            "are_acte",
            "ciudad",
            "telefono",
            "mensaje",
            "sexo",
            "discapacidad",
            "categoria",
            "empadronamiento",
            "libro_familia",
            "fotocopia_dni",
            "prestaciones",
            "nomnia",
            "cert_negativo",
            "aquiler_hipoteca",
            "recibos",
            "email",
            "covid",
            "otros_documentos",
        ]
        widgets = {
            "fecha_nacimiento": forms.DateInput(
                format=("%Y-%m-%d"),
                attrs={
                    "class": "form-control",
                    "placeholder": "Select Date",
                    "type": "date",
                },
            ),
            # "fecha_nacimiento": DateInput(attrs={"type": "date"}),
            "email": EmailInput(attrs={"type": "email"}),
        }

    def clean(self):

        super().clean()

        otros_documentos = self.cleaned_data.get("otros_documentos")
        dni = self.cleaned_data.get("dni")

        if not otros_documentos and not dni:
            self._errors["otros_documentos"] = self.error_class(
                ["Este campo es necesario"]
            )
            self._errors["dni"] = self.error_class(["Este campo es necesario"])

        if otros_documentos and dni:
            self._errors["otros_documentos"] = self.error_class(
                ["Solo debe haber un campo para la identificación"]
            )
            self._errors["dni"] = self.error_class(
                ["Solo debe haber un campo para la identificación"]
            )

        # return any errors if found
        return self.cleaned_data


class HijoForm(ModelForm):
    class Meta:
        model = Hijo
        fields = [
            "parentesco",
            "nombre_apellido",
            "dni",
            "otros_documentos",
            "fecha_nacimiento",
        ]
        widgets = {
            "fecha_nacimiento": forms.DateInput(
                format=("%Y-%m-%d"),
                attrs={
                    "class": "form-control",
                    "placeholder": "Select Date",
                    "type": "date",
                },
            ),
        }

    def clean(self):

        super().clean()

        otros_documentos = self.cleaned_data.get("otros_documentos")
        dni = self.cleaned_data.get("dni")

        if not otros_documentos and not dni:
            self._errors["otros_documentos"] = self.error_class(
                ["Este campo es necesario"]
            )
            self._errors["dni"] = self.error_class(["Este campo es necesario"])

        if otros_documentos and dni:
            self._errors["otros_documentos"] = self.error_class(
                ["Solo debe haber un campo para la identificación"]
            )
            self._errors["dni"] = self.error_class(
                ["Solo debe haber un campo para la identificación"]
            )

        # return any errors if found
        return self.cleaned_data


class UserEditForm(ModelForm):
    class Meta:
        model = User
        fields = ("first_name", "last_name", "email")


class ProfileEditForm(ModelForm):
    class Meta:
        model = Profile
        fields = ("date_of_birth",)
        widgets = {
            "date_of_birth": DateInput(attrs={"type": "text"}),
        }


class SignupForm(Form):
    first_name = forms.CharField(max_length=30, label="Nume")
    last_name = forms.CharField(max_length=30, label="Prenume")

    def signup(self, request, user):
        user.first_name = self.cleaned_data["first_name"]
        user.last_name = self.cleaned_data["last_name"]
        user.save()
