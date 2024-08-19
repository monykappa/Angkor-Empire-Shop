from rest_framework import viewsets
from .permissions import HasKeyPermission  # Import the custom permission class
from products.models import (
    Category, Brand, Color, Product, ProductImage, CpuBrand, GpuBrand, 
    CpuSpec, GpuSpec, MemoryBrand, MemorySpec, StorageBrand, StorageSpec, 
    DisplaySpec, PortSpec, WirelessConnectivity, WebcamSpec, BatterySpec, 
    OperatingSystem, LaptopSpec, Stock, RefreshRate, ResolutionSpec
)
from .serializers import (
    CategoryAPI, BrandAPI, ColorAPI, ProductAPI, ProductImageAPI, CpuBrandAPI, 
    GpuBrandAPI, CpuSpecAPI, GpuSpecAPI, MemoryBrandAPI, MemorySpecAPI, 
    StorageBrandAPI, StorageSpecAPI, DisplaySpecAPI, PortSpecAPI, 
    WirelessConnectivityAPI, WebcamSpecAPI, BatterySpecAPI, OperatingSystemAPI, 
    LaptopSpecAPI, StockAPI, RefreshRateAPI, ResolutionSpecAPI
)

class CategoryViewSet(viewsets.ModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategoryAPI
    permission_classes = [HasKeyPermission]

class BrandViewSet(viewsets.ModelViewSet):
    queryset = Brand.objects.all()
    serializer_class = BrandAPI
    permission_classes = [HasKeyPermission]

class ColorViewSet(viewsets.ModelViewSet):
    queryset = Color.objects.all()
    serializer_class = ColorAPI
    permission_classes = [HasKeyPermission]

class ProductViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductAPI
    permission_classes = [HasKeyPermission]

class ProductImageViewSet(viewsets.ModelViewSet):
    queryset = ProductImage.objects.all()
    serializer_class = ProductImageAPI
    permission_classes = [HasKeyPermission]

class CpuBrandViewSet(viewsets.ModelViewSet):
    queryset = CpuBrand.objects.all()
    serializer_class = CpuBrandAPI
    permission_classes = [HasKeyPermission]

class GpuBrandViewSet(viewsets.ModelViewSet):
    queryset = GpuBrand.objects.all()
    serializer_class = GpuBrandAPI
    permission_classes = [HasKeyPermission]

class CpuSpecViewSet(viewsets.ModelViewSet):
    queryset = CpuSpec.objects.all()
    serializer_class = CpuSpecAPI
    permission_classes = [HasKeyPermission]

class GpuSpecViewSet(viewsets.ModelViewSet):
    queryset = GpuSpec.objects.all()
    serializer_class = GpuSpecAPI
    permission_classes = [HasKeyPermission]

class MemoryBrandViewSet(viewsets.ModelViewSet):
    queryset = MemoryBrand.objects.all()
    serializer_class = MemoryBrandAPI
    permission_classes = [HasKeyPermission]

class MemorySpecViewSet(viewsets.ModelViewSet):
    queryset = MemorySpec.objects.all()
    serializer_class = MemorySpecAPI
    permission_classes = [HasKeyPermission]

class StorageBrandViewSet(viewsets.ModelViewSet):
    queryset = StorageBrand.objects.all()
    serializer_class = StorageBrandAPI
    permission_classes = [HasKeyPermission]

class StorageSpecViewSet(viewsets.ModelViewSet):
    queryset = StorageSpec.objects.all()
    serializer_class = StorageSpecAPI
    permission_classes = [HasKeyPermission]

class DisplaySpecViewSet(viewsets.ModelViewSet):
    queryset = DisplaySpec.objects.all()
    serializer_class = DisplaySpecAPI
    permission_classes = [HasKeyPermission]

class ResolutionSpecViewSet(viewsets.ModelViewSet):
    queryset = ResolutionSpec.objects.all()
    serializer_class = ResolutionSpecAPI
    permission_classes = [HasKeyPermission]

class RefreshRateViewSet(viewsets.ModelViewSet):
    queryset = RefreshRate.objects.all()
    serializer_class = RefreshRateAPI
    permission_classes = [HasKeyPermission]

class PortSpecViewSet(viewsets.ModelViewSet):
    queryset = PortSpec.objects.all()
    serializer_class = PortSpecAPI
    permission_classes = [HasKeyPermission]

class WirelessConnectivityViewSet(viewsets.ModelViewSet):
    queryset = WirelessConnectivity.objects.all()
    serializer_class = WirelessConnectivityAPI
    permission_classes = [HasKeyPermission]

class WebcamSpecViewSet(viewsets.ModelViewSet):
    queryset = WebcamSpec.objects.all()
    serializer_class = WebcamSpecAPI
    permission_classes = [HasKeyPermission]

class BatterySpecViewSet(viewsets.ModelViewSet):
    queryset = BatterySpec.objects.all()
    serializer_class = BatterySpecAPI
    permission_classes = [HasKeyPermission]

class OperatingSystemViewSet(viewsets.ModelViewSet):
    queryset = OperatingSystem.objects.all()
    serializer_class = OperatingSystemAPI
    permission_classes = [HasKeyPermission]

class LaptopSpecViewSet(viewsets.ModelViewSet):
    queryset = LaptopSpec.objects.all()
    serializer_class = LaptopSpecAPI
    permission_classes = [HasKeyPermission]

class StockViewSet(viewsets.ModelViewSet):
    queryset = Stock.objects.all()
    serializer_class = StockAPI
    permission_classes = [HasKeyPermission]
