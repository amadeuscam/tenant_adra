import glob
import os
import shutil
import time
from pathlib import Path
from adra.models import Persona
from django.core.management.base import BaseCommand
from mailmerge import MailMerge


class Command(BaseCommand):

    def handle(self, *args, **options):
        num_adra = [9, 31, 80, 82, 87, 98, 102, 121, 122, 132, 133, 137, 155, 157, 162, 164, 167, 168, 171, 176, 177,
                    178, 180, 181, 185, 186, 189, 192, 196, 197, 199, 201, 205, 207, 208, 209, 213, 215, 216, 217, 218,
                    219, 222, 223, 224, 225, 230, 236, 262, 346, 347, 402, 404, 405, 406, 407, 408, 409, 410, 414, 415]
        print(num_adra)
        persona = Persona.objects.filter(numero_adra__in=num_adra).order_by("numero_adra")
        Path("./valoraciones").mkdir(parents=True, exist_ok=True)

        for p in persona:

            print(p.numero_adra)
            # print(p.nombre_apellido)
            template = "adra/management/commands/vl.docx"
            document = MailMerge(template)
            # print(document.get_merge_fields())
            hijos = []

            for h in p.hijo.all():
                hijo_dict = {'parentesco': f'{h.parentesco}', 'nombre_apellido_hijo': f'{h.nombre_apellido}',
                             'dni_hijo': f'{h.dni}',
                             'fecha_nacimiento_hijo': f"{'{:%d-%m-%Y}'.format(h.fecha_nacimiento)}"}
                hijos.append(hijo_dict)
            document.merge(
                numar_adra=f'{p.numero_adra}',
                nombre_apellido=f'{p.nombre_apellido}',
                dni=f'{p.dni}',
                fecha_nacimiento=f"{'{:%d-%m-%Y}'.format(p.fecha_nacimiento)}",
                nacionalidad=f'{p.nacionalidad}',
                domicilio=f'{p.domicilio}',
                ciudad=f'{p.ciudad}',
                numar_telefon=f'{p.telefono}',
                # fecha_hoy=f"{'{:%d-%m-%Y}'.format(p.created_at)}",
                fecha_hoy="12-06-2022",

            )
            if p.empadronamiento:
                document.merge(a="x")
            if p.libro_familia:
                document.merge(b="x")
            if p.fotocopia_dni:
                document.merge(c="x")
            if p.prestaciones:
                document.merge(d="x")
            if p.nomnia:
                document.merge(e="x")
            if p.cert_negativo:
                document.merge(f="x")
            if p.aquiler_hipoteca:
                document.merge(g="x")
            if p.recibos:
                document.merge(h="x")
            document.merge_rows('parentesco', hijos)

            document.write(f'./valoraciones/{p.numero_adra}.docx')

        os.chdir("./valoraciones")
        for file in glob.glob("*.docx"):
            print(file)

        time.sleep(10)
        shutil.rmtree('./valoracion', ignore_errors=True)
