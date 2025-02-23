import io
import os
import random
import zipfile
from copy import copy, deepcopy
from datetime import date
from pathlib import Path
from random import randrange

import numpy as np
import pandas as pd
from django.db.models import Q
from jsignature.utils import draw_signature
from mailmerge import MailMerge
from openpyxl import Workbook
from openpyxl.styles import Alignment, PatternFill
from PyPDF2 import PdfFileMerger, PdfFileReader, PdfFileWriter
from PyPDF2.generic import (BooleanObject, IndirectObject, NameObject,
                            NumberObject, TextStringObject)
from reportlab.pdfgen import canvas

from adra.models import Hijo, Persona
from delegaciones.models import BeneficiariosGlobales


class AdraUtils:
    def __init__(self) -> None:
        pass

    def zip_files(self, path: str, clean_files=False):
        pdfs = os.listdir(path)
        print(f"The {len(pdfs)} files has been compressed")

        buffer = io.BytesIO()
        with zipfile.ZipFile(buffer, "w") as zipF:
            for file in pdfs:
                zipF.write(
                    f"{path}/{file}",
                    compress_type=zipfile.ZIP_DEFLATED,
                )
        if clean_files:
            self.remove_files(path=path)
        return buffer.getvalue()

    def remove_files(self, path: str):
        [f.unlink() for f in Path(path).glob("*") if f.is_file()]

    def split_list(self, big_list, x):
        return [big_list[i : i + x] for i in range(0, len(big_list), x)]


class DeliverySheet:
    def __init__(self, persona: Persona, tenat_info) -> None:
        self.persona = persona
        self.tenat_info = tenat_info
        self.pdf_writer = PdfFileWriter()
        self.count = 1
        self.general_data = {
            "NomOAR": f"{tenat_info.oar}",
            "DirOAR": f"{tenat_info.calle}",
            "Nombre y apellidos del representante de la unidad familiar": f"{self.persona.nombre_apellido}",  # noqa
            "DNINIEPasaporte 1": f"{self.persona.dni if self.persona.dni else self.persona.otros_documentos}",  # noqa
            "Teléfono": f"{self.persona.telefono}",
            "Domicilio": f"{self.persona.domicilio}",
            "Localidad": f"{self.persona.ciudad}",
            "Localidad_alta_1_1": f"{tenat_info.ciudad}",
            "Localidad_alta_1_0": f"{tenat_info.ciudad}",
            "CP": f"{self.persona.codigo_postal}",
            "numarAdra": f"{self.persona.numero_adra}",
        }
        self.firma_alimentos = {
            f"firm_1": {"x_start": 214, "y_start": 40},
            f"firm_2": {"x_start": 270, "y_start": 40},
            f"firm_3": {"x_start": 327, "y_start": 40},
            f"firm_4": {"x_start": 384, "y_start": 40},
            f"firm_5": {"x_start": 441, "y_start": 40},
            f"firm_6": {"x_start": 498, "y_start": 40},
            f"firm_7": {"x_start": 555, "y_start": 40},
            f"firm_8": {"x_start": 214, "y_start": 40},
            f"firm_9": {"x_start": 270, "y_start": 40},
            f"firm_10": {"x_start": 327, "y_start": 40},
            f"firm_11": {"x_start": 384, "y_start": 40},
            f"firm_12": {"x_start": 441, "y_start": 40},
            f"firm_13": {"x_start": 498, "y_start": 40},
            f"firm_14": {"x_start": 555, "y_start": 40},
            f"firm_alta": {"x_start": 676, "y_start": 98},
        }

        self.meses = [
            "Enero",
            "Febrero",
            "Marzo",
            "Abril",
            "Mayo",
            "Junio",
            "Julio",
            "Agosto",
            "Septiembre",
            "Octubre",
            "Noviembre",
            "Diciembre",
        ]
        self.dict_alimentos = {}
        self.pdf_reader = None
      

    def _load_file(self, name):
        path = os.path.join(os.path.abspath("source_files"), f"{name}.pdf")
        return PdfFileReader(path, strict=True)
        
    def set_appearances_writer(self):
        return self.set_need_appearances_writer(self.pdf_writer)

    def make_visible_data_and_block(self, page_arg):
        page = copy(self.pdf_writer.getPage(page_arg))
        self.pdf_writer.updatePageFormFieldValues(page, fields=self.general_data)
        

    def add_signature(self, alimentos):
        self.set_num_adults_and_childrens()
        
        if len(alimentos) > 0:
            for page, arr in enumerate(AdraUtils().split_list(alimentos, 7)):
                if page > 0:
                    pdf_reader = self._load_file("2024_entregas_full_pag_2")
                    self.pdf_writer.addPage(pdf_reader.pages[0])
                else:
                    pdf_reader = self._load_file("2024_entregas_full")
                    self.pdf_writer.addPage(pdf_reader.pages[0])

                for for_index, alimento in enumerate(arr, 1):
                    self.fill_fields(for_index, for_index, alimento, page)

                self.make_visible_data_and_block(page)
        else:
            pdf_reader = self._load_file("2024_entregas_full")
            self.pdf_writer.addPage(pdf_reader.pages[0])
            self.make_visible_data_and_block(0)

        self.set_appearances_writer()
        return self.pdf_writer

    def add_signature_all_beneficiarios(self):
        self.set_num_adults_and_childrens()

        alimentos = self.persona.alimentos.all().order_by("fecha_recogida")
 
        if len(alimentos) != 0:
            for page, arr in enumerate(AdraUtils().split_list(alimentos, 7)):
                if page > 0:
                    pdf_reader = self._load_file("2024_entregas_full_pag_2")
                    self.pdf_writer.addPage( pdf_reader.pages[0])
                else:
                    pdf_reader = self._load_file("2024_entregas_full")
                    self.pdf_writer.addPage(pdf_reader.pages[0])

                for for_index, alimento in enumerate(arr, 1):
                    self.fill_fields(for_index, for_index, alimento, page)

                self.make_visible_data_and_block(page)

               

            self.set_need_appearances_writer(self.pdf_writer)
            return self.pdf_writer
        else:
            pdf_reader = self._load_file("2024_entregas_full")
            self.pdf_writer.addPage(pdf_reader.pages[0])
            self.set_need_appearances_writer(self.pdf_writer)
            self.make_visible_data_and_block(0)

            return self.pdf_writer

    def set_num_adults_and_childrens(self):
        familiares = self.persona.hijo.all()

        mayores = 0
        menores = 0
        for f in familiares:
            if self.calculate_age(f.fecha_nacimiento) >= 3:
                mayores += 1
            else:
                menores += 1

        self.general_data.update(
            {
                "TOTAL MIEMBROS UNIDAD FAMILIAR": f"{mayores + menores + 1}",
                "Niños 02 ambos inclusive": f"{menores}",
                "N Miembros de otras edades": f"{mayores + 1}",
            }
        )

    def set_alta_date(self, index, alimento,page):
        # print(alimento.fecha_recogida)
        self.dict_alimentos.update(
            {
                f"dia_alta_{index}_{page}": alimento.fecha_recogida.day,
                f"mes_alta_{index}_{page}": self.meses[
                    alimento.fecha_recogida.month - 1
                ],
                f"ano_alta_{index}_{page}": alimento.fecha_recogida.year,
            }
        )

    def fill_fields(self, index, alm_index, alimento, page):
        if alimento.signature:
            if alm_index == 1:
                self.add_image_pdf(
                    self.pdf_writer.getPage(page),
                    self.firma_alimentos,
                    "firm_alta",
                    alimento,
                )

                self.add_image_pdf(
                    self.pdf_writer.getPage(page),
                    self.firma_alimentos,
                    alm_index,
                    alimento,
                )
                self.set_alta_date(alm_index, alimento,page)
            else:
                self.add_image_pdf(
                    self.pdf_writer.getPage(page),
                    self.firma_alimentos,
                    alm_index,
                    alimento,
                )
        else:
            self.set_alta_date(alm_index, alimento,page)
        # print(index)
        # print(page)
        self.dict_alimentos.update(
            {
                f"2023Arroz blanco_{alm_index}_{page}": alimento.alimento_1,
                f"2023Garbanzos cocidos_{alm_index}_{page}": alimento.alimento_2,
                f"2023Conserva de atún_{alm_index}_{page}": alimento.alimento_3,
                f"2023Conserva de carne_{alm_index}_{page}": alimento.alimento_4,
                f"2023Pasta alimenticia espagueti_{alm_index}_{page}": alimento.alimento_5,
                f"2023Pasta alimenticia fideo_{alm_index}_{page}": alimento.alimento_6,
                f"2023Tomate frito en conserva APIS_{alm_index}_{page}": alimento.alimento_7,
                f"2023Tomate frito en conserva ACICO_{alm_index}_{page}": alimento.alimento_8,
                f"2023Galletas_{alm_index}_{page}": alimento.alimento_9,
                f"2023Macedonia de verduras en conserva_{alm_index}_{page}": alimento.alimento_10,
                f"2023Cacao soluble_{alm_index}_{page}": alimento.alimento_11,
                f"2023Tarritos infantiles pollo_{alm_index}_{page}": alimento.alimento_12,
                f"2023Tarritos infantiles fruta_{alm_index}_{page}": alimento.alimento_13,
                f"2023Alubias cocidas_{alm_index}_{page}": alimento.alimento_14,
                f"2023Conserva de sardina_{alm_index}_{page}": alimento.alimento_15,
                f"2023Fruta en conserva_{alm_index}_{page}": alimento.alimento_16,
                f"dia_{alm_index}_{page}": alimento.fecha_recogida.day,
                f"mes_{alm_index}_{page}": alimento.fecha_recogida.month,
                f"ano_{alm_index}_{page}": alimento.fecha_recogida.year,
            }
        )

        self.general_data.update(self.dict_alimentos)
        # return self.dict_alimentos

    def set_need_appearances_writer(self, writer):
        """
        Helper para escribir el pdf
        :param writer: el pdf
        :return:
        """
        try:
            catalog = writer._root_object
            # get the AcroForm tree and add "/NeedAppearances attribute
            if "/AcroForm" not in catalog:
                writer._root_object.update(
                    {
                        NameObject("/AcroForm"): IndirectObject(
                            len(writer._objects), 0, writer
                        )
                    }
                )

            need_appearances = NameObject("/NeedAppearances")
            writer._root_object["/AcroForm"][need_appearances] = BooleanObject(
                True
            )
            return writer

        except Exception as e:
            print("set_need_appearances_writer() catch : ", repr(e))
            return writer

    def calculate_age(self, age):
        today = date.today()
        return (
            today.year
            - age.year
            - ((today.month, today.day) < (age.month, age.day))
        )

    def add_image_pdf(self, page, dict, index, alimento):
        packet = io.BytesIO()
        can = canvas.Canvas(packet)

        if isinstance(index, str):
            can.drawImage(
                draw_signature(alimento.signature, as_file=True),
                dict[f"firm_alta"]["x_start"],
                dict[f"firm_alta"]["y_start"],
                width=70,
                height=30,
                preserveAspectRatio=True,
                mask="auto",
                # anchor="c",
                # showBoundary=True,
            )
            # can.showPage()
        else:
            can.drawImage(
                draw_signature(alimento.signature, as_file=True),
                dict[f"firm_{index}"]["x_start"],
                dict[f"firm_{index}"]["y_start"],
                width=55,
                height=30,
                preserveAspectRatio=False,
                mask="auto",
                anchor="c",
                # anchorAtXY=True,
                # showBoundary=True
            )
            # can.showPage()

        # can.showPage()
        can.save()

        # move to the beginning of the StringIO buffer
        packet.seek(0)
        new_pdf = PdfFileReader(packet)
        page.mergePage(new_pdf.getPage(0))


class ValoracionSocial:
    def __init__(self, persona) -> None:
        self.persona = persona
        self.template = os.path.join(
            os.path.abspath("source_files"), "vl.docx"
        )
        self.document = MailMerge(self.template)

    def add_beneficiario_info(self):
        self.document.merge(
            numar_adra=f"{self.persona.numero_adra}",
            nombre_apellido=f"{self.persona.nombre_apellido}",
            dni=f"{self.persona.dni if self.persona.dni else self.persona.otros_documentos}",
            fecha_nacimiento=f"{'{:%d-%m-%Y}'.format(self.persona.fecha_nacimiento)}",
            nacionalidad=f"{self.persona.nacionalidad}",
            domicilio=f"{self.persona.domicilio}",
            ciudad=f"{self.persona.ciudad}",
            provincia=f"{self.persona.codigo_postal}",
            numar_telefon=f"{self.persona.telefono}",
            fecha_hoy="",
        )

    def add_familiares_info(self):
        hijos = []

        for h in self.persona.hijo.all():
            hijo_dict = {}
            hijo_dict["parentesco"] = f"{h.parentesco}"
            hijo_dict["nombre_apellido_hijo"] = f"{h.nombre_apellido}"
            hijo_dict["dni_hijo"] = f"{h.dni}"
            hijo_dict["pasaporte"] = f"{h.otros_documentos}"
            hijo_dict[
                "fecha_nacimiento_hijo"
            ] = f"{'{:%d-%m-%Y}'.format(h.fecha_nacimiento)}"
            hijos.append(hijo_dict)

        self.document.merge_rows("parentesco", hijos)

    def documentacion_check(self):
        if self.persona.empadronamiento:
            self.document.merge(a="x")
        if self.persona.libro_familia:
            self.document.merge(b="x")
        if self.persona.fotocopia_dni:
            self.document.merge(c="x")
        if self.persona.prestaciones:
            self.document.merge(d="x")
        if self.persona.nomnia:
            self.document.merge(e="x")
        if self.persona.cert_negativo:
            self.document.merge(f="x")
        if self.persona.aquiler_hipoteca:
            self.document.merge(g="x")
        if self.persona.recibos:
            self.document.merge(h="x")

    def get_valoracion(self):
        self.add_beneficiario_info()
        self.add_familiares_info()
        self.documentacion_check()
        return self.document


class AgeCalculacion:
    def __init__(self, beneficiario, familiares) -> None:
        self.beneficiario = beneficiario
        self.familiares = familiares

    def age_range(self, min_age, max_age, model, extra_filter: dict):
        current = date.today()
        min_date = date(current.year - min_age, current.month, current.day)
        max_date = date(current.year - max_age, current.month, current.day)

        return model.filter(
            fecha_nacimiento__gte=max_date,
            fecha_nacimiento__lte=min_date,
            **extra_filter,
        )

    def calculate_age(self):
        ben_0_2_m = self.age_range(
            0, 3, self.beneficiario, {"sexo": "mujer"}
        ).count()
        ben_0_2_h = self.age_range(
            0, 3, self.beneficiario, {"sexo": "hombre"}
        ).count()
        ben_3_15_m = self.age_range(
            3, 16, self.beneficiario, {"sexo": "mujer"}
        ).count()
        ben_3_15_h = self.age_range(
            3, 16, self.beneficiario, {"sexo": "hombre"}
        ).count()
        ben_16_64_m = self.age_range(
            16, 65, self.beneficiario, {"sexo": "mujer"}
        ).count()
        ben_16_64_h = self.age_range(
            16, 65, self.beneficiario, {"sexo": "hombre"}
        ).count()
        ben_65_100_m = self.age_range(
            65, 100, self.beneficiario, {"sexo": "mujer"}
        ).count()
        ben_65_100_h = self.age_range(
            65, 100, self.beneficiario, {"sexo": "hombre"}
        ).count()

        fam_0_2_m = self.age_range(
            0, 3, self.familiares, {"sexo": "mujer"}
        ).count()
        fam_0_2_h = self.age_range(
            0, 3, self.familiares, {"sexo": "hombre"}
        ).count()
        fam_3_15_m = self.age_range(
            3, 16, self.familiares, {"sexo": "mujer"}
        ).count()
        fam_3_15_h = self.age_range(
            3, 16, self.familiares, {"sexo": "hombre"}
        ).count()
        fam_16_64_m = self.age_range(
            16, 65, self.familiares, {"sexo": "mujer"}
        ).count()
        fam_16_64_h = self.age_range(
            16, 65, self.familiares, {"sexo": "hombre"}
        ).count()
        fam_65_100_m = self.age_range(
            65, 100, self.familiares, {"sexo": "mujer"}
        ).count()
        fam_65_100_h = self.age_range(
            65, 100, self.familiares, {"sexo": "hombre"}
        ).count()

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

        ben_descapacitados = self.beneficiario.filter(
            discapacidad=True, active=True
        ).count()

        fam_descapacitados = self.familiares.filter(
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
            "total_beneficiarios": self.beneficiario.count(),
            "total_familiares": self.familiares.count(),
        }
        return data_statistics


class UploadExcelUsers:
    def __init__(self, file, current_user):
        self.file = file
        self.current_user = current_user
        self.miembros_uf = None
        self.main_df = None
        self.relacion_beneficiarios = None
        self.beneficarios_fraudulentos = []
        self.load_sheet()
        self.join_information()
        self.beneficiario = None
        self.number = None

    def load_sheet(self):
        self.relacion_beneficiarios = pd.read_excel(
            self.file, sheet_name="Relacion Beneficiarios"
        )
        self.miembros_uf = pd.read_excel(
            self.file, sheet_name="Miembros UF", skiprows=1
        )
        self.rename_columns()

    def rename_columns(self):
        col_rename_relacion = {
            "Marcar con una X el representante de la unidad familiar ": "representate_familiar",
            "NOMBRE DEL BENEFICIARIO\n(Apellidos y Nombre)": "nombre_appelido",
            "NIF/NIE": "nie",
            "PASAPORTE": "pasaporte",
            "FECHA DE NACIMIENTO\n(dd/mm/aaaa)": "fecha_nacimiento",
        }
        self.relacion_beneficiarios.rename(
            columns=col_rename_relacion, inplace=True
        )

    def join_information(self):
        # print(self.relacion_beneficiarios["pasaporte"])
        # print(self.relacion_beneficiarios["nie"])
        self.relacion_beneficiarios[
            "nie_juntos"
        ] = self.relacion_beneficiarios.apply(
            lambda row: row["pasaporte"]
            if pd.isna(row["nie"])
            else row["nie"],
            axis=1,
        )
        self.relacion_beneficiarios.fillna(value=0, inplace=True)

        self.main_df = self.relacion_beneficiarios.merge(
            self.miembros_uf,
            left_on=["nie_juntos"],
            right_on=["DNI/NIE/Pasaporte"],
            how="left",
        )
        self.main_df = self.main_df.fillna({"Teléfono": 0})
        # print(self.main_df)

    def check_fraudulent_payees(self, data) -> bool:
        # print(data)
        logic = Q(
            documentacion_beneficiario=data["nie_juntos"],
            telefono=data["Teléfono"],
            _connector=Q.OR,
        )
        beneficario_global = BeneficiariosGlobales.objects.filter(
            logic, nombre_beneficiario=data["nombre_appelido"]
        )
        # print(beneficario_global.count())
        if beneficario_global.count() > 0:
            for beneficario in beneficario_global:
                self.beneficarios_fraudulentos.append(
                    {
                        "nombre": beneficario.nombre_beneficiario,
                        "oar": beneficario.delegacion_name,
                    }
                )
            # print(self.beneficarios_fraudulentos)
            # print("cogen de otro sitio")
            return True
        else:
            return False

    def groub_familiares(self, row):
        try:
            if str(row.lower()) == "x":
                self.number = randrange(10000)
                return self.number
        except AttributeError:
            return self.number

    def upload_payees(self):
        self.main_df["dss"] = self.main_df["representate_familiar"].apply(
            self.groub_familiares
        )
        gkk = self.main_df.groupby(["dss"])
        for name, group in gkk:
            # print(name, group)
            # print(group[group["representate_familiar"].str.lower() == "x"])

            for index, row in group.iterrows():
                # print(row)
                if not self.check_fraudulent_payees(row):
                    if str(row["representate_familiar"]).lower() == "x":
                        beneficiario, created = Persona.objects.get_or_create(
                            nombre_apellido=row["nombre_appelido"],
                            dni=row["nie"] if not row["nie"] == 0.0 else "",
                            otros_documentos=row["pasaporte"],
                            fecha_nacimiento=row["fecha_nacimiento"],
                            numero_adra=int(row["Nº"]),
                            nacionalidad="sin definir",
                            domicilio=row["Domicilio"],
                            are_acte=False,
                            ciudad=row["Localidad"],
                            telefono=int(row["Teléfono"]),
                            modificado_por_id=self.current_user.pk,
                            mensaje="ALTA NUEVA",
                            active=True,
                            sexo="mujer",
                            discapacidad=False,
                            aquiler_hipoteca=False,
                            cert_negativo=False,
                            empadronamiento=False,
                            fotocopia_dni=False,
                            libro_familia=False,
                            nomnia=False,
                            prestaciones=False,
                            recibos=False,
                            email="",
                            covid=False,
                            codigo_postal=row["CP"]
                            if pd.notnull(row["CP"])
                            else 0,
                        )
                        familiares = group[
                            group["representate_familiar"].str.lower() != "x"
                        ]
                        # print(familiares)
                        for _, row_fam in familiares.iterrows():
                            Hijo.objects.create(
                                parentesco="familiar",
                                sexo="mujer",
                                nombre_apellido=row_fam["nombre_appelido"],
                                dni=row_fam["nie"]
                                if not row_fam["nie"] == 0.0
                                else "",
                                otros_documentos=row_fam["pasaporte"],
                                fecha_nacimiento=row_fam["fecha_nacimiento"],
                                edad=0,
                                active=True,
                                persona=beneficiario,
                                modificado_por=self.current_user,
                                discapacidad=False,
                            )

        return self.beneficarios_fraudulentos


class RecuntoBeneficiarios:
    def __init__(self) -> None:
        self.template = os.path.join(
            os.path.abspath("source_files"), "mod_2023.docx"
        )
        self.document = MailMerge(self.template)

    def getRecuentoFile(self):
        beneficiar = Persona.objects.filter(active=True).exclude(covid=True)

        familiares = Hijo.objects.filter(
            persona__in=Persona.objects.filter(active=True).exclude(covid=True)
        )
        age_calc = AgeCalculacion(beneficiar, familiares).calculate_age()
        print(age_calc)
        self.document.merge(

            mujerdos=f"{age_calc['total_per_mujer_02']}",
            mujerquince=f"{age_calc['total_per_mujer_03']}",
            mujersesentacuatro=f"{age_calc['total_per_mujer_16']}",
            mujermassesentacinco=f"{age_calc['total_per_mujer_65']}",
            mtotal=f"{age_calc['total_mujeres']}",

            hombredos=f"{age_calc['total_per_hombre_02']}",
            hombrequince=f"{age_calc['total_per_hombre_03']}",
            hombresesentacuatro=f"{age_calc['total_per_hombre_16']}",
            hombresmassesentacinco=f"{age_calc['total_per_hombre_65']}",
            htotal=f"{age_calc['total_hombres']}",

            totaldos=f"{age_calc['total_02']}",
            totalquince=f"{age_calc['total_03']}",
            totalsesentacuatro=f"{age_calc['total_16']}",
            totalmassesentacinco=f"{age_calc['total_65']}",

            totalbeneficiarios=f"{age_calc['total_beneficiarios']}",
           



            total=f"{age_calc['total_personas']}",
            discap=f"{age_calc['discapacidad']}"
        )

        return self.document
