# Generated by Django 5.0.6 on 2024-08-12 13:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0020_orderhistory_receipt'),
    ]

    operations = [
        migrations.AlterField(
            model_name='orderhistory',
            name='payment_method',
            field=models.CharField(blank=True, choices=[('paypal', 'PayPal'), ('credit_card', 'Credit Card'), ('aba_bank', 'ABA Bank'), ('acleda_bank', 'ACLEDA Bank'), ('wing_bank', 'Wing Bank')], default='paypal', max_length=50, null=True),
        ),
    ]
