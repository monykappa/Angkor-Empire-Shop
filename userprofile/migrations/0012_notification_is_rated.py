# Generated by Django 5.0.6 on 2024-08-08 08:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userprofile', '0011_notification_notification_type_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='notification',
            name='is_rated',
            field=models.BooleanField(default=False),
        ),
    ]
