# Generated by Django 5.0.6 on 2024-08-12 12:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0017_alter_productrating_rating'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='payment_method',
            field=models.CharField(blank=True, choices=[('paypal', 'PayPal'), ('credit_card', 'Credit Card'), ('aba_bank', 'ABA Bank'), ('acleda_bank', 'ACLEDA Bank'), ('wing_bank', 'Wing Bank')], max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='orderhistory',
            name='payment_method',
            field=models.CharField(blank=True, choices=[('paypal', 'PayPal'), ('credit_card', 'Credit Card'), ('aba_bank', 'ABA Bank'), ('acleda_bank', 'ACLEDA Bank'), ('wing_bank', 'Wing Bank')], max_length=50, null=True),
        ),
    ]
