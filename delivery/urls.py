from django.urls import path, include
from django.contrib import admin
from django.urls import include, path
from django.conf import settings
from django.conf.urls.static import static
from django.urls import re_path as url
from django.shortcuts import render 
from . import views
from django.conf import settings

app_name = 'delivery'

urlpatterns = [
    path('dashboard/delivery/order', views.DeliveryGuyDashboardView.as_view(), name='delivery_guy_dashboard'),
    path('dashboard/delivery/complete/<int:assignment_id>/', views.MarkDeliveryCompleteView.as_view(), name='mark_delivery_complete'),
    path('dashboard/delivery/history/', views.DeliveryHistoryReportView.as_view(), name='delivery_history_report'),
    path('dashboard/delivery/', views.dashboard, name='dashboard'),
    path('delivery-by-date/', views.DeliveryChartDataView.as_view(), name='delivery_chart_data'),
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

