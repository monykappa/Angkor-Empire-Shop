# Generated by Django 5.0.6 on 2024-07-16 04:11

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0007_orderaddress_orderhistory_order_address'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='order_address',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='orders.orderaddress'),
        ),
    ]
