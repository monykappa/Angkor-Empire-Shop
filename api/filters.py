import django_filters
from products.models import Product
from django_filters import rest_framework as filters

class ProductFilter(django_filters.FilterSet):
    key = django_filters.CharFilter(field_name='key', lookup_expr='icontains')

    class Meta:
        model = Product
        fields = ['key']
