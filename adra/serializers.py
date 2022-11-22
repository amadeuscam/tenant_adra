from django.contrib.auth import get_user_model
from rest_framework import serializers
from .models import Persona, Hijo, Alimentos, AlmacenAlimentos


def timesince(dt, default="now"):
    from datetime import datetime
    from django.utils import timezone
    now = timezone.now()
    diff = now - dt
    # print(diff.days)
    periods = (
        (diff.days / 365, "year", "years"),
        (diff.days / 30, "month", "months"),
        (diff.days / 7, "week", "weeks"),
        (diff.days, "day", "days"),
        (diff.seconds / 3600, "hour", "hours"),
        (diff.seconds / 60, "minute", "minutes"),
        (diff.seconds, "second", "seconds"),
    )
    for period, singular, plural in periods:
        if period >= 1:
            return "%d %s ago" % (period, singular if period == 1 else plural)
    return default


class AlimentosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Alimentos
        fields = "__all__"


class AlacenAlimentosSerializer(serializers.ModelSerializer):
    alimento_1_name = serializers.CharField(
        default=f"{AlmacenAlimentos._meta.get_field('alimento_1').verbose_name}",  # noqa
        read_only=True,
    )
    alimento_2_name = serializers.CharField(
        default=f"{AlmacenAlimentos._meta.get_field('alimento_2').verbose_name}",  # noqa
        read_only=True,
    )
    alimento_3_name = serializers.CharField(
        default=f"{AlmacenAlimentos._meta.get_field('alimento_3').verbose_name}",  # noqa
        read_only=True,
    )
    alimento_4_name = serializers.CharField(
        default=f"{AlmacenAlimentos._meta.get_field('alimento_4').verbose_name}",  # noqa
        read_only=True,
    )

    alimento_5_name = serializers.CharField(
        default=f"{AlmacenAlimentos._meta.get_field('alimento_5').verbose_name}",  # noqa
        read_only=True,
    )
    alimento_6_name = serializers.CharField(
        default=f"{AlmacenAlimentos._meta.get_field('alimento_6').verbose_name}",  # noqa
        read_only=True,
    )
    alimento_7_name = serializers.CharField(
        default=f"{AlmacenAlimentos._meta.get_field('alimento_7').verbose_name}",  # noqa
        read_only=True,
    )
    alimento_8_name = serializers.CharField(
        default=f"{AlmacenAlimentos._meta.get_field('alimento_8').verbose_name}",  # noqa
        read_only=True,
    )

    alimento_9_name = serializers.CharField(
        default=f"{AlmacenAlimentos._meta.get_field('alimento_9').verbose_name}",  # noqa
        read_only=True,
    )
    alimento_10_name = serializers.CharField(
        default=f"{AlmacenAlimentos._meta.get_field('alimento_10').verbose_name}",  # noqa
        read_only=True,
    )
    alimento_11_name = serializers.CharField(
        default=f"{AlmacenAlimentos._meta.get_field('alimento_11').verbose_name}",  # noqa
        read_only=True,
    )
    alimento_12_name = serializers.CharField(
        default=f"{AlmacenAlimentos._meta.get_field('alimento_12').verbose_name}",  # noqa
        read_only=True,
    )

    class Meta:
        model = AlmacenAlimentos
        fields = "__all__"


class HijosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Hijo
        fields = (
            "nombre_apellido",
            "dni",
            "fecha_nacimiento",
            "parentesco",
            "age",
        )


class PersonaSerializer(serializers.HyperlinkedModelSerializer):
    modificado_por = serializers.ReadOnlyField(
        source="modificado_por.username"
    )
    covids = serializers.ReadOnlyField(source="covid")
    alimentos = AlimentosSerializer(many=True, read_only=True)
    hijo = HijosSerializer(many=True, read_only=True)

    # def get_full_name(self, obj):
    #     return len([fam for fam in obj.hijo.all() if fam.age <= 3])
    #
    # def get_family_number(self, obj):
    #     return obj.hijo.all().count() + 1
    #
    # def get_last_date_alimentos(self, obj):
    #     try:
    #         return timesince(obj.alimentos.latest('fecha_recogida').fecha_recogida)
    #     except Exception:
    #         return None
    #
    # def get_last_date_alimentos_format(self, obj):
    #     try:
    #         return obj.alimentos.latest('fecha_recogida').fecha_recogida.strftime("%d-%m-%Y")
    #     except Exception:
    #         return None

    class Meta:
        model = Persona
        fields = [
            "id",
            "nombre_apellido",
            "numero_adra",
            "dni",
            "telefono",
            "empadronamiento",
            "libro_familia",
            "mensaje",
            "categoria",
            "are_acte",
            "sexo",
            "age",
            "discapacidad",
            "covids",
            "modificado_por",
            "fecha_nacimiento",
            "alimentos",
            "hijo",
            "fotocopia_dni",
            "prestaciones",
            "nomnia",
            "cert_negativo",
            "aquiler_hipoteca",
            "recibos",
        ]


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = get_user_model()
        fields = ["id", "username", "email", "is_staff"]
