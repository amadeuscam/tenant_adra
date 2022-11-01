import io
import os
import random
import zipfile
from datetime import date
from pathlib import Path

from adra.models import Persona
from jsignature.utils import draw_signature
from mailmerge import MailMerge
from openpyxl import Workbook
from openpyxl.styles import Alignment, PatternFill
from PyPDF2 import PdfFileReader, PdfFileWriter
from PyPDF2.generic import (BooleanObject, IndirectObject, NameObject,
                            NumberObject)
from reportlab.pdfgen import canvas


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
        self.field_dictionary = {
            "NomOAR": f"{tenat_info.oar}",
            "DirOAR": f"{tenat_info.calle}",
            "Nombre y apellidos del representante de la unidad familiar": f"{self.persona.nombre_apellido}",  # noqa
            "DNINIEPasaporte 1": f"{self.persona.dni if self.persona.dni else self.persona.otros_documentos}",  # noqa
            "Teléfono": f"{self.persona.telefono}",
            "Domicilio": f"{self.persona.domicilio}",
            "Localidad": f"{self.persona.ciudad}",
            "Localidad_alta": f"{tenat_info.ciudad}",
            "CP": f"{self.persona.codigo_postal}",
            "numarAdra": f"{self.persona.numero_adra}",
        }
        self.firma_alimentos = {
            f"firm_1": {"x_start": 214, "y_start": 74},
            f"firm_2": {"x_start": 270, "y_start": 74},
            f"firm_3": {"x_start": 327, "y_start": 74},
            f"firm_4": {"x_start": 384, "y_start": 74},
            f"firm_5": {"x_start": 441, "y_start": 74},
            f"firm_6": {"x_start": 498, "y_start": 74},
            f"firm_7": {"x_start": 555, "y_start": 74},
            f"firm_alta": {"x_start": 676, "y_start": 103},
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

    def _load_file(self):
        path = os.path.join(
            os.path.abspath("source_files"), "2022_entrega_full.pdf"
        )
        pdf_reader = PdfFileReader(path, strict=True)
        self.pdf_writer.addPage(pdf_reader.getPage(0))
        self.pdf_writer = self.set_appearances_writer()
        return self.pdf_writer

    def set_appearances_writer(self):
        return self.set_need_appearances_writer(self.pdf_writer)

    def make_visible_data_and_block(self):
        self.pdf_writer.updatePageFormFieldValues(
            self.pdf_writer.getPage(0), self.field_dictionary
        )

        for j in range(0, len(self.pdf_writer.getPage(0)["/Annots"])):
            writer_annot = self.pdf_writer.getPage(0)["/Annots"][j].getObject()
            if writer_annot.get("/T"):
                writer_annot.update({NameObject("/Ff"): NumberObject(1)})

    def export_template_pdf(self, name):
        self.set_num_adults_and_childrens()
        pdf = self._load_file()
        self.make_visible_data_and_block()
        return pdf

    def add_signature(self, alimentos):
        self.set_num_adults_and_childrens()
        pdf = self._load_file()

        # print(len(alimentos))
        # print(pdf.getNumPages())

        for index, alimento in enumerate(alimentos, 1):
            self.fill_fields(index, alimento, pdf, 0)
        # print(self.dict_alimentos)

        self.make_visible_data_and_block()
        random_string = "".join(
            chr(random.randrange(65, 90)) for i in range(10)
        )
        pdf.write(
            open(
                f"source_files/generated_pdfs/{self.persona.numero_adra}_{random_string}.pdf",
                "wb",
            )
        )

    def set_num_adults_and_childrens(self):
        familiares = self.persona.hijo.all()

        mayores = 0
        menores = 0
        for f in familiares:
            if self.calculate_age(f.fecha_nacimiento) >= 3:
                mayores += 1
            else:
                menores += 1

        self.field_dictionary.update(
            {
                "TOTAL MIEMBROS UNIDAD FAMILIAR": f"{mayores + menores + 1}",
                "Niños 02 ambos inclusive": f"{menores}",
            }
        )

    def set_alta_date(self, alimento):
        self.dict_alimentos.update(
            {
                "dia_alta": alimento.fecha_recogida.day,
                "mes_alta": self.meses[alimento.fecha_recogida.month - 1],
                "ano_alta": alimento.fecha_recogida.year,
            }
        )

    def fill_fields(self, index, alimento, pdf_writer, page):

        if alimento.signature:
            if index == 1:
                self.add_image_pdf(
                    pdf_writer.getPage(page),
                    self.firma_alimentos,
                    "firm_alta",
                    alimento,
                )

                self.add_image_pdf(
                    pdf_writer.getPage(page),
                    self.firma_alimentos,
                    index,
                    alimento,
                )
                self.set_alta_date(alimento)
            else:
                self.add_image_pdf(
                    pdf_writer.getPage(page),
                    self.firma_alimentos,
                    index,
                    alimento,
                )
        else:
            if index == 1:
                self.set_alta_date(alimento)

        self.dict_alimentos.update(
            {
                f"2022Arroz blanco_{index}": alimento.alimento_1,
                f"2022Alubia cocida_{index}": alimento.alimento_2,
                f"2022Conserva de atún_{index}": alimento.alimento_3,
                f"2022Pasta alimenticia tipo macarrón_{index}": alimento.alimento_4,
                f"2022Tomate frito en conserva_{index}": alimento.alimento_5,
                f"2022Galletas_{index}": alimento.alimento_6,
                f"2022Macedonia de verduras en conserva_{index}": alimento.alimento_7,
                f"2022Fruta en conserva_{index}": alimento.alimento_8,
                f"2022Cacao soluble_{index}": alimento.alimento_9,
                f"2022Tarritos infantiles con pollo_{index}": alimento.alimento_10,
                f"2022Tarritos infantiles de fruta_{index}": alimento.alimento_11,
                f"2022Leche entera UHT_{index}": alimento.alimento_12,
                f"2022Aceite de oliva_{index}": alimento.alimento_13,
                f"dia_{index}": alimento.fecha_recogida.day,
                f"mes_{index}": alimento.fecha_recogida.month,
                f"ano_{index}": alimento.fecha_recogida.year,
            }
        )

        self.field_dictionary.update(self.dict_alimentos)

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
            can.showPage()
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
            can.showPage()

        can.showPage()
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
            numar_telefon=f"{self.persona.telefono}",
            fecha_hoy="",
        )

    def add_familiares_info(self):
        hijos = []

        for h in self.persona.hijo.all():
            hijo_dict = {}
            hijo_dict["parentesco"] = f"{h.parentesco}"
            hijo_dict["nombre_apellido_hijo"] = f"{h.nombre_apellido}"
            hijo_dict["dni_hijo"] = f"{h.dni if h.dni else h.otros_documentos}"
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
