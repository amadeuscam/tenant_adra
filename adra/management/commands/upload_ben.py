import csv
import os

import pandas as pd
from django.conf import settings
from django.contrib.auth.models import User
from django.core.management.base import BaseCommand
from django_tenants.utils import get_tenant_model, tenant_context

from adra.models import Hijo, Persona


class Command(BaseCommand):
    def handle(self, *args, **options):
        user = User.objects.get(id=1)
        print(user.pk)
        # raise
        for tenant in get_tenant_model().objects.exclude(schema_name="public"):
            with tenant_context(tenant):
                if tenant.code == 2:

                    csv_ben = open(
                        os.path.join(
                            settings.BASE_DIR / "adra_persona_202211040507.csv"
                        ),
                        "r",
                    )
                    csv_fam = open(
                        os.path.join(
                            settings.BASE_DIR / "adra_hijo_202211040547.csv"
                        ),
                        "r",
                    )
                    ben_data_df = pd.read_csv(csv_ben, sep=";")
                    fam_data_df = pd.read_csv(csv_fam, sep=";")

                    print(ben_data_df)
                    print(fam_data_df)
                    for index, row in ben_data_df.iterrows():
                        # print(index, row["id"], row["numero_adra"])
                        n = Persona.objects.create(
                            nombre_apellido=row["nombre_apellido"],
                            dni=row["dni"]
                            if row["dni"]
                            else row["otros_documentos"],
                            fecha_nacimiento=row["fecha_nacimiento"],
                            numero_adra=int(row["numero_adra"]),
                            nacionalidad=row["nacionalidad"],
                            domicilio=row["domicilio"],
                            are_acte=int(row["are_acte"]),
                            ciudad=row["ciudad"],
                            telefono=row["telefono"],
                            modificado_por_id=user.pk,
                            mensaje=row["mensaje"],
                            active=int(row["active"]),
                            sexo=row["sexo"],
                            discapacidad=int(row["discapacidad"]),
                            categoria=int(row["categoria"]),
                            aquiler_hipoteca=int(row["aquiler_hipoteca"]),
                            cert_negativo=int(row["cert_negativo"]),
                            empadronamiento=int(row["empadronamiento"]),
                            fotocopia_dni=int(row["fotocopia_dni"]),
                            libro_familia=int(row["libro_familia"]),
                            nomnia=int(row["nomnia"]),
                            prestaciones=int(row["prestaciones"]),
                            recibos=int(row["recibos"]),
                            email=row["email"],
                            covid=int(row["covid"]),
                            codigo_postal=28850,
                            otros_documentos=row["otros_documentos"],
                        )
                        # print(fam_data_df[fam_data_df['persona_id'] == row['id']])
                        for index, fam in fam_data_df[
                            fam_data_df["persona_id"] == row["id"]
                        ].iterrows():
                            print(fam)
                            Hijo.objects.create(
                                parentesco=fam["parentesco"],
                                sexo=fam["sexo"],
                                nombre_apellido=fam["nombre_apellido"],
                                dni=fam["dni"],
                                otros_documentos=fam["otros_documentos"],
                                fecha_nacimiento=fam["fecha_nacimiento"],
                                edad=fam["edad"],
                                active=fam["active"],
                                persona=n,
                                modificado_por=user,
                                discapacidad=fam["discapacidad"],
                            )
