from datetime import date

from django.contrib.auth import get_user_model
from django.contrib.auth.models import User
from django.core.validators import validate_email
from django.db import models
from django.urls import reverse
from jsignature.fields import JSignatureField
from django.conf import settings


class Persona(models.Model):
    SEXO = [("mujer", "Mujer"), ("hombre", "Hombre")]

    nombre_apellido = models.CharField(
        max_length=100, verbose_name="Nombre del beneficiario", unique=True
    )
    dni = models.CharField(max_length=20, blank=True)
    otros_documentos = models.CharField(max_length=20, blank=True)
    fecha_nacimiento = models.DateField(auto_now_add=False)
    numero_adra = models.IntegerField(unique=True)
    nacionalidad = models.CharField(max_length=20)
    covid = models.BooleanField(default=False, verbose_name="Covid entregas")
    domicilio = models.TextField()
    are_acte = models.BooleanField(default=False, verbose_name="Tiene papeles")
    ciudad = models.CharField(max_length=350)
    telefono = models.IntegerField(unique=True)
    email = models.CharField(
        max_length=100,
        blank=True,
        default="",
        verbose_name="Email beneficiario",
        validators=[validate_email],
    )
    mensaje = models.TextField(blank=True)
    active = models.BooleanField(default=True, verbose_name="Activo?")
    modificado_por = models.ForeignKey(
        User, on_delete=models.DO_NOTHING, null=True
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    sexo = models.CharField(
        max_length=20,
        choices=SEXO,
    )
    discapacidad = models.BooleanField(default=False)
    codigo_postal = models.IntegerField(default=0)
    empadronamiento = models.BooleanField(
        default=False,
        verbose_name="Certificado de empadronamiento actualizado "
                     "con fecha de menos de tres meses ",
    )
    libro_familia = models.BooleanField(
        default=False, verbose_name="Fotocopia del Libro de Familia "
    )
    fotocopia_dni = models.BooleanField(
        default=False,
        verbose_name="Fotocopia del DNI/NIE o pasaporte de todos los "
                     "miembros del núcleo familiar",
    )
    prestaciones = models.BooleanField(
        default=False,
        verbose_name="Fotocopia de la documentación que acredite de"
                     " prestación, pensión, paro, etc",
    )
    nomnia = models.BooleanField(
        default=False,
        verbose_name="Fotocopia de la nómina en caso de trabajar.",
    )
    cert_negativo = models.BooleanField(
        default=False,
        verbose_name="En caso de no tener ingresos: certificado"
                     " negativo de rentas, de la Agencia Tributaria.",
    )
    aquiler_hipoteca = models.BooleanField(
        default=False,
        verbose_name="Ultimo recibo alquiler o  hipoteca de"
                     " vivienda familiar en la que están empadronados",
    )
    recibos = models.BooleanField(
        default=False,
        verbose_name="Recibo de gastos básicos: luz, agua, gas, "
                     "calefacción, comunidad y  comedor escolar.",
    )

    class Meta:
        ordering = ("-created_at",)
        verbose_name = "Beneficiario"
        verbose_name_plural = "Beneficiarios"

    def __str__(self):
        return self.nombre_apellido

    def get_absolute_url(self):
        return reverse("adra:personas_detail", args=[str(self.id)])

    @property
    def numero_beneficiarios(self):
        return self.hijo.count() + 1

    def get_babys_number(self):
        return len([fam for fam in self.hijo.all() if fam.age <= 3])

    @property
    def age(self):
        today = date.today()
        return (
                today.year
                - self.fecha_nacimiento.year
                - (
                        (today.month, today.day)
                        < (self.fecha_nacimiento.month, self.fecha_nacimiento.day)
                )
        )


class Hijo(models.Model):
    SEXO = (("mujer", "Mujer"), ("hombre", "Hombre"))

    parentesco = models.CharField(max_length=50)
    nombre_apellido = models.CharField(max_length=50)
    dni = models.CharField(max_length=50, blank=True)
    otros_documentos = models.CharField(max_length=50, blank=True)
    fecha_nacimiento = models.DateField(
        auto_now=False, verbose_name="Formato fecha-> dia/mes/año"
    )
    edad = models.IntegerField(default=0, blank=False, null=False)
    active = models.BooleanField(default=True, verbose_name="Activo?")
    persona = models.ForeignKey(
        Persona, on_delete=models.CASCADE, related_name="hijo"
    )
    modificado_por = models.ForeignKey(
        User, on_delete=models.DO_NOTHING, null=True
    )
    discapacidad = models.BooleanField(default=False)
    sexo = models.CharField(
        max_length=20,
        choices=SEXO,
    )

    class Meta:
        verbose_name = "Familiar del Beneficiario"
        verbose_name_plural = "Familiares del Beneficiario"

    def get_absolute_url(self):
        return reverse("adra:personas_detail", kwargs={"pk": self.persona.pk})

    def __str__(self):
        return self.nombre_apellido

    @property
    def age(self):
        today = date.today()
        return (
                today.year
                - self.fecha_nacimiento.year
                - (
                        (today.month, today.day)
                        < (self.fecha_nacimiento.month, self.fecha_nacimiento.day)
                )
        )


class Alimentos(models.Model):
    alimento_1 = models.IntegerField(default=None, verbose_name="Arroz Blanco")

    alimento_2 = models.IntegerField(
        default=None, verbose_name="Alubia cocida"
    )
    alimento_3 = models.IntegerField(
        default=None, verbose_name="Conserva de atún"
    )
    alimento_4 = models.IntegerField(
        default=None, verbose_name="Pasta alimenticia tipo macarron"
    )
    alimento_5 = models.IntegerField(
        default=None, verbose_name="Tomate frito en conserva"
    )
    alimento_6 = models.IntegerField(default=None, verbose_name="Galletas")
    alimento_7 = models.IntegerField(
        default=None, verbose_name="Macedonia de verduras en conserva"
    )
    alimento_8 = models.IntegerField(
        default=None, verbose_name="Fruta en conserva"
    )
    alimento_9 = models.IntegerField(
        default=None, verbose_name="Cacao soluble"
    )
    alimento_10 = models.IntegerField(
        default=None, verbose_name="Tarritos infantiles con pollo"
    )
    alimento_11 = models.IntegerField(
        default=None, verbose_name="Tarritos infantiles de fruta"
    )
    alimento_12 = models.IntegerField(
        default=None, verbose_name="Leche entera UHT"
    )
    alimento_13 = models.IntegerField(
        default=None, verbose_name="Aceite de oliva"
    )

    modificado_por = models.ForeignKey(
        User, on_delete=models.DO_NOTHING, null=True
    )
    persona = models.ForeignKey(
        Persona, on_delete=models.CASCADE, related_name="alimentos"
    )
    signature = JSignatureField(default=None, blank=True, null=True)
    fecha_recogida = models.DateTimeField(auto_now_add=False)
    created_at = models.DateField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ["-fecha_recogida"]
        verbose_name = "Alimento"
        verbose_name_plural = "Alimentos"

    def get_absolute_url(self):
        return reverse("adra:personas_detail", kwargs={"pk": self.persona.id})


class AlmacenAlimentos(models.Model):
    alimento_1 = models.IntegerField(default=None, verbose_name="Arroz Blanco")

    alimento_2 = models.IntegerField(
        default=None, verbose_name="Alubia cocida"
    )
    alimento_3 = models.IntegerField(
        default=None, verbose_name="Conserva de atún"
    )
    alimento_4 = models.IntegerField(
        default=None, verbose_name="Pasta alimenticia tipo macarron"
    )
    alimento_5 = models.IntegerField(
        default=None, verbose_name="Tomate frito en conserva"
    )
    alimento_6 = models.IntegerField(default=None, verbose_name="Galletas")

    alimento_7 = models.IntegerField(
        default=None, verbose_name="Macedonia de verduras en conserva"
    )
    alimento_8 = models.IntegerField(
        default=None, verbose_name="Fruta en conserva"
    )
    alimento_9 = models.IntegerField(
        default=None, verbose_name="Cacao soluble"
    )
    alimento_10 = models.IntegerField(
        default=None, verbose_name="Tarritos infantiles con pollo"
    )
    alimento_11 = models.IntegerField(
        default=None, verbose_name="Tarritos infantiles de fruta"
    )
    alimento_12 = models.IntegerField(
        default=None, verbose_name="Leche entera UHT"
    )
    alimento_13 = models.IntegerField(
        default=None, verbose_name="Aceite de oliva"
    )

    modificado_por = models.ForeignKey(
        User, on_delete=models.DO_NOTHING, null=True
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)

    alimento_1_caducidad = models.DateField(
        auto_now_add=False,
        blank=True,
        default=None,
        verbose_name="Arroz Blanco",
    )
    alimento_2_caducidad = models.DateField(
        auto_now_add=False,
        blank=True,
        default=None,
        verbose_name="Alubia cocida",
    )
    alimento_3_caducidad = models.DateField(
        auto_now_add=False,
        blank=True,
        default=None,
        verbose_name="Conserva de atún",
    )
    alimento_4_caducidad = models.DateField(
        auto_now_add=False,
        blank=True,
        default=None,
        verbose_name="Pasta alimenticia tipo macarron",
    )
    alimento_5_caducidad = models.DateField(
        auto_now_add=False,
        blank=True,
        default=None,
        verbose_name="Tomate frito en conserva",
    )
    alimento_6_caducidad = models.DateField(
        auto_now_add=False, blank=True, default=None, verbose_name="Galletas"
    )
    alimento_7_caducidad = models.DateField(
        auto_now_add=False,
        blank=True,
        default=None,
        verbose_name="Macedonia de verduras en conserva",
    )
    alimento_8_caducidad = models.DateField(
        auto_now_add=False,
        blank=True,
        default=None,
        verbose_name="Fruta en conserva",
    )
    alimento_9_caducidad = models.DateField(
        auto_now_add=False,
        blank=True,
        default=None,
        verbose_name="Cacao soluble",
    )
    alimento_10_caducidad = models.DateField(
        auto_now_add=False,
        blank=True,
        default=None,
        verbose_name="Tarritos infantiles con pollo",
    )
    alimento_11_caducidad = models.DateField(
        auto_now_add=False,
        blank=True,
        default=None,
        verbose_name="Tarritos infantiles de fruta",
    )
    alimento_12_caducidad = models.DateField(
        auto_now_add=False,
        blank=True,
        default=None,
        verbose_name="Leche entera UHT",
    )
    alimento_13_caducidad = models.DateField(
        auto_now_add=False,
        blank=True,
        default=None,
        verbose_name="Aceite de oliva",
    )

    class Meta:
        verbose_name = "Almacen Alimento"
        verbose_name_plural = "Almacen Alimentos"

    def get_absolute_url(self):
        return reverse("adra:almacen-home")

    @staticmethod
    def caducidad(self, number):
        obj = AlmacenAlimentos.objects.first()
        field_object = self._meta.get_field(f"alimento_{number}_caducidad")
        field_value = field_object.value_from_object(obj)
        today = date.today()
        days = (field_value - today).days
        return field_object.verbose_name.title(), days


class Profile(models.Model):
    SEXO = (("mujer", "Mujer"), ("hombre", "Hombre"))
    user = models.OneToOneField(get_user_model(), on_delete=models.CASCADE)
    date_of_birth = models.DateField(blank=True, null=True)
    sexo = models.CharField(
        max_length=20,
        choices=SEXO,
        default="mujer"
    )

    # photo = models.ImageField(upload_to='profile_pics',\
    # default='profile_pics/default.png', blank=True)

    def __str__(self):
        return f"Profile for user {self.user.username}"


class AlimentosRepatir(models.Model):
    TIPO = (("unidad", "Unidad"), ("familia", "Familia"))

    alimento_1 = models.IntegerField(default=0, verbose_name=settings.ALIMENTOS_METADATA["alimento_1"]["name"])
    alimento_1_type = models.CharField(choices=TIPO, max_length=21, default="unidad", verbose_name='Entrega')
    alimento_1_0_3 = models.IntegerField(default=0, verbose_name="Rango 0-3 familia")
    alimento_1_4_6 = models.IntegerField(default=0, verbose_name="Rango 4-6 familia")
    alimento_1_7_9 = models.IntegerField(default=0, verbose_name="Rango 7-9 familia")

    alimento_2 = models.IntegerField(default=0, verbose_name=settings.ALIMENTOS_METADATA["alimento_2"]["name"])
    alimento_2_type = models.CharField(choices=TIPO, max_length=20, default="unidad", verbose_name='Entrega')
    alimento_2_0_3 = models.IntegerField(default=0, verbose_name="Rango 0-3 familia")
    alimento_2_4_6 = models.IntegerField(default=0, verbose_name="Rango 4-6 familia")
    alimento_2_7_9 = models.IntegerField(default=0, verbose_name="Rango 7-9 familia")

    alimento_3 = models.IntegerField(default=0, verbose_name=settings.ALIMENTOS_METADATA["alimento_3"]["name"])
    alimento_3_type = models.CharField(choices=TIPO, max_length=20, default="unidad", verbose_name='Entrega')
    alimento_3_0_3 = models.IntegerField(default=0, verbose_name="Rango 0-3 familia")
    alimento_3_4_6 = models.IntegerField(default=0, verbose_name="Rango 4-6 familia")
    alimento_3_7_9 = models.IntegerField(default=0, verbose_name="Rango 7-9 familia")

    alimento_4 = models.IntegerField(default=0, verbose_name=settings.ALIMENTOS_METADATA["alimento_4"]["name"])
    alimento_4_type = models.CharField(choices=TIPO, max_length=20, default="unidad", verbose_name='Entrega')
    alimento_4_0_3 = models.IntegerField(default=0, verbose_name="Rango 0-3 familia")
    alimento_4_4_6 = models.IntegerField(default=0, verbose_name="Rango 4-6 familia")
    alimento_4_7_9 = models.IntegerField(default=0, verbose_name="Rango 7-9 familia")

    alimento_5 = models.IntegerField(default=0, verbose_name=settings.ALIMENTOS_METADATA["alimento_5"]["name"])
    alimento_5_type = models.CharField(choices=TIPO, max_length=20, default="unidad", verbose_name='Entrega')
    alimento_5_0_3 = models.IntegerField(default=0, verbose_name="Rango 0-3 familia")
    alimento_5_4_6 = models.IntegerField(default=0, verbose_name="Rango 4-6 familia")
    alimento_5_7_9 = models.IntegerField(default=0, verbose_name="Rango 7-9 familia")

    alimento_6 = models.IntegerField(default=0, verbose_name=settings.ALIMENTOS_METADATA["alimento_6"]["name"])
    alimento_6_type = models.CharField(choices=TIPO, max_length=20, default="unidad", verbose_name='Entrega')
    alimento_6_0_3 = models.IntegerField(default=0, verbose_name="Rango 0-3 familia")
    alimento_6_4_6 = models.IntegerField(default=0, verbose_name="Rango 4-6 familia")
    alimento_6_7_9 = models.IntegerField(default=0, verbose_name="Rango 7-9 familia")

    alimento_7 = models.IntegerField(default=0, verbose_name=settings.ALIMENTOS_METADATA["alimento_7"]["name"])
    alimento_7_type = models.CharField(choices=TIPO, max_length=20, default="unidad", verbose_name='Entrega')
    alimento_7_0_3 = models.IntegerField(default=0, verbose_name="Rango 0-3 familia")
    alimento_7_4_6 = models.IntegerField(default=0, verbose_name="Rango 4-6 familia")
    alimento_7_7_9 = models.IntegerField(default=0, verbose_name="Rango 7-9 familia")

    alimento_8 = models.IntegerField(default=0, verbose_name=settings.ALIMENTOS_METADATA["alimento_8"]["name"])
    alimento_8_type = models.CharField(choices=TIPO, max_length=20, default="unidad", verbose_name='Entrega')
    alimento_8_0_3 = models.IntegerField(default=0, verbose_name="Rango 0-3 familia")
    alimento_8_4_6 = models.IntegerField(default=0, verbose_name="Rango 4-6 familia")
    alimento_8_7_9 = models.IntegerField(default=0, verbose_name="Rango 7-9 familia")

    alimento_9 = models.IntegerField(default=0, verbose_name=settings.ALIMENTOS_METADATA["alimento_9"]["name"])
    alimento_9_type = models.CharField(choices=TIPO, max_length=20, default="unidad", verbose_name='Entrega')
    alimento_9_0_3 = models.IntegerField(default=0, verbose_name="Rango 0-3 familia")
    alimento_9_4_6 = models.IntegerField(default=0, verbose_name="Rango 4-6 familia")
    alimento_9_7_9 = models.IntegerField(default=0, verbose_name="Rango 7-9 familia")

    alimento_10 = models.IntegerField(default=0, verbose_name=settings.ALIMENTOS_METADATA["alimento_10"]["name"])
    alimento_10_type = models.CharField(choices=TIPO, max_length=20, default="unidad", verbose_name='Entrega')
    alimento_10_0_3 = models.IntegerField(default=0, verbose_name="Rango 0-3 familia")
    alimento_10_4_6 = models.IntegerField(default=0, verbose_name="Rango 4-6 familia")
    alimento_10_7_9 = models.IntegerField(default=0, verbose_name="Rango 7-9 familia")

    alimento_11 = models.IntegerField(default=0, verbose_name=settings.ALIMENTOS_METADATA["alimento_11"]["name"])
    alimento_11_type = models.CharField(choices=TIPO, max_length=20, default="unidad", verbose_name='Entrega')
    alimento_11_0_3 = models.IntegerField(default=0, verbose_name="Rango 0-3 familia")
    alimento_11_4_6 = models.IntegerField(default=0, verbose_name="Rango 4-6 familia")
    alimento_11_7_9 = models.IntegerField(default=0, verbose_name="Rango 7-9 familia")

    alimento_12 = models.IntegerField(default=0, verbose_name=settings.ALIMENTOS_METADATA["alimento_12"]["name"])
    alimento_12_type = models.CharField(choices=TIPO, max_length=20, default="unidad", verbose_name='Entrega')
    alimento_12_0_3 = models.IntegerField(default=0, verbose_name="Rango 0-3 familia")
    alimento_12_4_6 = models.IntegerField(default=0, verbose_name="Rango 4-6 familia")
    alimento_12_7_9 = models.IntegerField(default=0, verbose_name="Rango 7-9 familia")

    alimento_13 = models.IntegerField(default=0, verbose_name=settings.ALIMENTOS_METADATA["alimento_13"]["name"])
    alimento_13_type = models.CharField(choices=TIPO, max_length=20, default="unidad", verbose_name='Entrega')
    alimento_13_0_3 = models.IntegerField(default=0, verbose_name="Rango 0-3 familia")
    alimento_13_4_6 = models.IntegerField(default=0, verbose_name="Rango 4-6 familia")
    alimento_13_7_9 = models.IntegerField(default=0, verbose_name="Rango 7-9 familia")

    modificado_por = models.ForeignKey(User, on_delete=models.DO_NOTHING)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "Alimento a Repatir"
        verbose_name_plural = "Alimentos a Repatir"
