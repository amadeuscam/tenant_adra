# Generated by Django 3.2.10 on 2022-12-08 06:58

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('adra', '0006_auto_20221205_1155'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='persona',
            name='categoria',
        ),
    ]
