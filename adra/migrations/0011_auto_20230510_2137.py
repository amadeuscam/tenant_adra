# Generated by Django 3.2.10 on 2023-05-10 19:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adra', '0010_alimentosrepatir'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='alimentos',
            name='alimento_13',
        ),
        migrations.RemoveField(
            model_name='alimentosrepatir',
            name='alimento_13',
        ),
        migrations.RemoveField(
            model_name='alimentosrepatir',
            name='alimento_13_0_3',
        ),
        migrations.RemoveField(
            model_name='alimentosrepatir',
            name='alimento_13_4_6',
        ),
        migrations.RemoveField(
            model_name='alimentosrepatir',
            name='alimento_13_7_9',
        ),
        migrations.RemoveField(
            model_name='alimentosrepatir',
            name='alimento_13_type',
        ),
        migrations.RemoveField(
            model_name='almacenalimentos',
            name='alimento_13',
        ),
        migrations.RemoveField(
            model_name='almacenalimentos',
            name='alimento_13_caducidad',
        ),
        migrations.AlterField(
            model_name='alimentos',
            name='alimento_10',
            field=models.IntegerField(default=None, verbose_name='Cacao soluble'),
        ),
        migrations.AlterField(
            model_name='alimentos',
            name='alimento_11',
            field=models.IntegerField(default=None, verbose_name='Tarritos infantiles pollo'),
        ),
        migrations.AlterField(
            model_name='alimentos',
            name='alimento_12',
            field=models.IntegerField(default=None, verbose_name='Tarritos infantiles fruta'),
        ),
        migrations.AlterField(
            model_name='alimentos',
            name='alimento_2',
            field=models.IntegerField(default=None, verbose_name='Garbanzos cocidos'),
        ),
        migrations.AlterField(
            model_name='alimentos',
            name='alimento_4',
            field=models.IntegerField(default=None, verbose_name='Conserva de carne'),
        ),
        migrations.AlterField(
            model_name='alimentos',
            name='alimento_5',
            field=models.IntegerField(default=None, verbose_name='Pasta alimenticia (espagueti)'),
        ),
        migrations.AlterField(
            model_name='alimentos',
            name='alimento_6',
            field=models.IntegerField(default=None, verbose_name='Pasta alimenticia (fideo)'),
        ),
        migrations.AlterField(
            model_name='alimentos',
            name='alimento_7',
            field=models.IntegerField(default=None, verbose_name='Tomate frito en conserva'),
        ),
        migrations.AlterField(
            model_name='alimentos',
            name='alimento_8',
            field=models.IntegerField(default=None, verbose_name='Galletas'),
        ),
        migrations.AlterField(
            model_name='alimentos',
            name='alimento_9',
            field=models.IntegerField(default=None, verbose_name='Macedonia de verduras en conserva'),
        ),
        migrations.AlterField(
            model_name='alimentosrepatir',
            name='alimento_10',
            field=models.IntegerField(default=0, verbose_name='Cacao soluble'),
        ),
        migrations.AlterField(
            model_name='alimentosrepatir',
            name='alimento_11',
            field=models.IntegerField(default=0, verbose_name='Tarritos infantiles pollo'),
        ),
        migrations.AlterField(
            model_name='alimentosrepatir',
            name='alimento_12',
            field=models.IntegerField(default=0, verbose_name='Tarritos infantiles fruta'),
        ),
        migrations.AlterField(
            model_name='alimentosrepatir',
            name='alimento_2',
            field=models.IntegerField(default=0, verbose_name='Garbanzos cocidos'),
        ),
        migrations.AlterField(
            model_name='alimentosrepatir',
            name='alimento_4',
            field=models.IntegerField(default=0, verbose_name='Conserva de carne'),
        ),
        migrations.AlterField(
            model_name='alimentosrepatir',
            name='alimento_5',
            field=models.IntegerField(default=0, verbose_name='Pasta alimenticia (espagueti)'),
        ),
        migrations.AlterField(
            model_name='alimentosrepatir',
            name='alimento_6',
            field=models.IntegerField(default=0, verbose_name='Pasta alimenticia (fideo)'),
        ),
        migrations.AlterField(
            model_name='alimentosrepatir',
            name='alimento_7',
            field=models.IntegerField(default=0, verbose_name='Tomate frito en conserva'),
        ),
        migrations.AlterField(
            model_name='alimentosrepatir',
            name='alimento_8',
            field=models.IntegerField(default=0, verbose_name='Galletas'),
        ),
        migrations.AlterField(
            model_name='alimentosrepatir',
            name='alimento_9',
            field=models.IntegerField(default=0, verbose_name='Macedonia de verduras en conserva'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_10',
            field=models.IntegerField(default=None, verbose_name='Cacao soluble'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_10_caducidad',
            field=models.DateField(blank=True, default=None, verbose_name='Cacao soluble'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_11',
            field=models.IntegerField(default=None, verbose_name='Tarritos infantiles pollo'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_11_caducidad',
            field=models.DateField(blank=True, default=None, verbose_name='Tarritos infantiles pollo'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_12',
            field=models.IntegerField(default=None, verbose_name='Tarritos infantiles fruta'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_12_caducidad',
            field=models.DateField(blank=True, default=None, verbose_name='Tarritos infantiles fruta'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_2',
            field=models.IntegerField(default=None, verbose_name='Garbanzos cocidos'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_2_caducidad',
            field=models.DateField(blank=True, default=None, verbose_name='Garbanzos cocidos'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_4',
            field=models.IntegerField(default=None, verbose_name='Conserva de carne'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_4_caducidad',
            field=models.DateField(blank=True, default=None, verbose_name='Conserva de carne'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_5',
            field=models.IntegerField(default=None, verbose_name='Pasta alimenticia (espagueti)'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_5_caducidad',
            field=models.DateField(blank=True, default=None, verbose_name='Pasta alimenticia (espagueti)'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_6',
            field=models.IntegerField(default=None, verbose_name='Pasta alimenticia (fideo)'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_6_caducidad',
            field=models.DateField(blank=True, default=None, verbose_name='Pasta alimenticia (fideo)'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_7',
            field=models.IntegerField(default=None, verbose_name='Tomate frito en conserva'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_7_caducidad',
            field=models.DateField(blank=True, default=None, verbose_name='Tomate frito en conserva'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_8',
            field=models.IntegerField(default=None, verbose_name='Galletas'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_8_caducidad',
            field=models.DateField(blank=True, default=None, verbose_name='Galletas'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_9',
            field=models.IntegerField(default=None, verbose_name='Macedonia de verduras en conserva'),
        ),
        migrations.AlterField(
            model_name='almacenalimentos',
            name='alimento_9_caducidad',
            field=models.DateField(blank=True, default=None, verbose_name='Macedonia de verduras en conserva'),
        ),
    ]
