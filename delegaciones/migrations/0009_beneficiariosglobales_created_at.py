# Generated by Django 3.2.10 on 2022-10-30 08:09

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('delegaciones', '0008_delegaciones_oar'),
    ]

    operations = [
        migrations.AddField(
            model_name='beneficiariosglobales',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]
