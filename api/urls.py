from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import (
    CategoryViewSet, BrandViewSet, ColorViewSet, ProductViewSet, ProductImageViewSet,
    CpuBrandViewSet, GpuBrandViewSet, CpuSpecViewSet, GpuSpecViewSet, MemoryBrandViewSet,
    MemorySpecViewSet, StorageBrandViewSet, StorageSpecViewSet, DisplaySpecViewSet,
    PortSpecViewSet, WirelessConnectivityViewSet, WebcamSpecViewSet, BatterySpecViewSet,
    OperatingSystemViewSet, LaptopSpecViewSet, StockViewSet, RefreshRateViewSet,
    ResolutionSpecViewSet
)

router = DefaultRouter()
router.register(r'categories', CategoryViewSet)
router.register(r'company-brands', BrandViewSet)
router.register(r'colors', ColorViewSet)
router.register(r'products', ProductViewSet)
router.register(r'product-images', ProductImageViewSet)
router.register(r'cpu-brands', CpuBrandViewSet)
router.register(r'gpu-brands', GpuBrandViewSet)
router.register(r'cpu-specs', CpuSpecViewSet)
router.register(r'gpu-specs', GpuSpecViewSet)
router.register(r'memory-brands', MemoryBrandViewSet)
router.register(r'memory-specs', MemorySpecViewSet)
router.register(r'storage-brands', StorageBrandViewSet)
router.register(r'storage-specs', StorageSpecViewSet)
router.register(r'display-specs', DisplaySpecViewSet)
router.register(r'resolution-specs', ResolutionSpecViewSet)
router.register(r'refresh-rates', RefreshRateViewSet)
router.register(r'port-specs', PortSpecViewSet)
router.register(r'wireless-connectivity', WirelessConnectivityViewSet)
router.register(r'webcam-specs', WebcamSpecViewSet)
router.register(r'battery-specs', BatterySpecViewSet)
router.register(r'operating-systems', OperatingSystemViewSet)
router.register(r'laptops-specs', LaptopSpecViewSet)
router.register(r'stocks', StockViewSet)

urlpatterns = [
    path('', include(router.urls)),
]