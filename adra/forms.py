from django import forms
from django.contrib.auth.models import User
from django.forms import DateInput, EmailInput, Form, ModelForm
from jsignature.forms import JSignatureField
from jsignature.widgets import JSignatureWidget

from .models import Alimentos, AlmacenAlimentos, Hijo, Persona, Profile


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
            "signature": JSignatureWidget(
                jsignature_attrs={"color": "#405e9d"}
            ),
        }


class AlmacenAlimentosFrom(ModelForm):
    # signature = JSignatureField()

    class Meta:
        model = AlmacenAlimentos
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
            "alimento_1_caducidad",
            "alimento_2_caducidad",
            "alimento_3_caducidad",
            "alimento_4_caducidad",
            "alimento_5_caducidad",
            "alimento_6_caducidad",
            "alimento_7_caducidad",
            "alimento_8_caducidad",
            "alimento_9_caducidad",
            "alimento_10_caducidad",
            "alimento_11_caducidad",
            "alimento_12_caducidad",
            "alimento_13_caducidad",
        )
        widgets = {
            "alimento_1_caducidad": DateInput(
                format=("%Y-%m-%d"),
                attrs={
                    "class": "form-control",
                    "placeholder": "Select Date",
                    "type": "date",
                },
            ),
            "alimento_2_caducidad": DateInput(
                format=("%Y-%m-%d"),
                attrs={
                    "class": "form-control",
                    "placeholder": "Select Date",
                    "type": "date",
                },
            ),
            "alimento_3_caducidad": DateInput(
                format=("%Y-%m-%d"),
                attrs={
                    "class": "form-control",
                    "placeholder": "Select Date",
                    "type": "date",
                },
            ),
            "alimento_4_caducidad": DateInput(
                format=("%Y-%m-%d"),
                attrs={
                    "class": "form-control",
                    "placeholder": "Select Date",
                    "type": "date",
                },
            ),
            "alimento_5_caducidad": DateInput(
                format=("%Y-%m-%d"),
                attrs={
                    "class": "form-control",
                    "placeholder": "Select Date",
                    "type": "date",
                },
            ),
            "alimento_6_caducidad": DateInput(
                format=("%Y-%m-%d"),
                attrs={
                    "class": "form-control",
                    "placeholder": "Select Date",
                    "type": "date",
                },
            ),
            "alimento_7_caducidad": DateInput(
                format=("%Y-%m-%d"),
                attrs={
                    "class": "form-control",
                    "placeholder": "Select Date",
                    "type": "date",
                },
            ),
            "alimento_8_caducidad": DateInput(
                format=("%Y-%m-%d"),
                attrs={
                    "class": "form-control",
                    "placeholder": "Select Date",
                    "type": "date",
                },
            ),
            "alimento_9_caducidad": DateInput(
                format=("%Y-%m-%d"),
                attrs={
                    "class": "form-control",
                    "placeholder": "Select Date",
                    "type": "date",
                },
            ),
            "alimento_10_caducidad": DateInput(
                format=("%Y-%m-%d"),
                attrs={
                    "class": "form-control",
                    "placeholder": "Select Date",
                    "type": "date",
                },
            ),
            "alimento_11_caducidad": DateInput(
                format=("%Y-%m-%d"),
                attrs={
                    "class": "form-control",
                    "placeholder": "Select Date",
                    "type": "date",
                },
            ),
            "alimento_12_caducidad": DateInput(
                format=("%Y-%m-%d"),
                attrs={
                    "class": "form-control",
                    "placeholder": "Select Date",
                    "type": "date",
                },
            ),
            "alimento_13_caducidad": DateInput(
                format=("%Y-%m-%d"),
                attrs={
                    "class": "form-control",
                    "placeholder": "Select Date",
                    "type": "date",
                },
            ),
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
            "codigo_postal",
            "otros_documentos",
            "active"
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
            "discapacidad",
            "sexo",
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
        fields = ("date_of_birth", "sexo")
        widgets = {
            "date_of_birth": DateInput(attrs={"type": "text"}),
        }


class DelegacionForm(forms.Form):
    nombre = forms.CharField(
        label="Nombre",
        help_text="Este nombre aparecera en la esquina izq de la plataforma",
        max_length=100,
        widget=forms.TextInput(attrs={"class": "form-control"}),
    )
    oar = forms.CharField(
        label="Nombre Oar",
        help_text="Este nombre aparecera en los documentos oficales",
        max_length=100,
        widget=forms.TextInput(attrs={"class": "form-control"}),
    )
    codigo_postal = forms.IntegerField(
        label="Codigo postal",
        help_text="Este nombre aparecera en los documentos oficales",
        widget=forms.NumberInput(attrs={"class": "form-control"}),
    )
    ciudad = forms.CharField(
        label="Ciudad",
        max_length=254,
        help_text="Este nombre aparecera en los documentos oficales",
        widget=forms.TextInput(attrs={"class": "form-control"}),
    )
    calle = forms.CharField(
        label="Calle",
        max_length=200,
        help_text="Este nombre aparecera en los documentos oficales",
        widget=forms.TextInput(attrs={"class": "form-control"}),
    )
    provincia = forms.CharField(
        label="Provincia",
        max_length=200,
        help_text="Este nombre aparecera en los documentos oficales",
        widget=forms.TextInput(attrs={"class": "form-control"}),
    )


class SignupForm(Form):
    first_name = forms.CharField(max_length=30, label="Nume")
    last_name = forms.CharField(max_length=30, label="Prenume")

    def signup(self, request, user):
        user.first_name = self.cleaned_data["first_name"]
        user.last_name = self.cleaned_data["last_name"]
        user.save()
