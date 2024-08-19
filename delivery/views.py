from shared_imports import *

from django.http import JsonResponse
from django.utils import timezone
from django.views import View
from django.db.models import Count
import pandas as pd
import plotly.express as px
from .models import DeliveryAssignment
from django.views import View
from django.http import JsonResponse
from django.utils import timezone
from .models import DeliveryAssignment
import pandas as pd
import plotly.express as px

class DeliveryChartDataView(View):
    def get(self, request, *args, **kwargs):
        period = request.GET.get("period", "all")  # 'all', '7_days', or '1_month'
        user_id = request.GET.get("user_id")  # Get the user_id from the request

        if not user_id:
            return JsonResponse({'error': 'User ID is required'})

        # Fetch DeliveryAssignment entries based on the period and user
        if period == "7_days":
            start_date = timezone.now() - timezone.timedelta(days=7)
            deliveries = DeliveryAssignment.objects.filter(
                assigned_at__gte=start_date,
                delivery_staff__user_id=user_id
            )
        elif period == "1_month":
            start_date = timezone.now() - timezone.timedelta(days=30)
            deliveries = DeliveryAssignment.objects.filter(
                assigned_at__gte=start_date,
                delivery_staff__user_id=user_id
            )
        else:
            deliveries = DeliveryAssignment.objects.filter(delivery_staff__user_id=user_id)

        # Convert the queryset to a list of dictionaries
        data = list(deliveries.values("assigned_at"))

        # Create a DataFrame from the data
        df = pd.DataFrame(data)

        if df.empty:
            return JsonResponse({'error': 'No data available for the selected period and user'})

        # Ensure 'assigned_at' is a datetime column
        df["assigned_at"] = pd.to_datetime(df["assigned_at"])

        # Extract date only (removing time part) and count occurrences
        df["date"] = df["assigned_at"].dt.date
        df_counts = df["date"].value_counts().sort_index()

        # Prepare data for Plotly
        plot_data = {"Date": df_counts.index, "Number of Deliveries": df_counts.values}
        plot_df = pd.DataFrame(plot_data)

        # Create the line chart with a curved line
        fig = px.line(
            plot_df,
            x="Date",
            y="Number of Deliveries",
            title=f"My Number by date",
            markers=True,
        )

        # Add dots with delivery count annotations and shaded area below the line
        fig.update_traces(
            mode="lines+markers+text",
            text=plot_df["Number of Deliveries"],
            textposition="top center",
            marker=dict(
                size=8,
                color="rgba(0, 123, 255, 1)",
                line=dict(width=2, color="DarkSlateGrey"),
            ),
            line=dict(
                shape="spline",  # Make the line curved
                width=2
            ),
            fill="tozeroy",  # Fill the area under the line
            fillcolor="rgba(0, 123, 255, 0.3)",
        )

        # Convert the Plotly figure to JSON
        chart_json = fig.to_json()

        return JsonResponse({'chart': chart_json})

@login_required
def dashboard(request):
    try:
        delivery_staff = request.user.deliverystaff
    except DeliveryStaff.DoesNotExist:
        return render(request, 'dashboard/auth/access_denied.html')

    # Total completed deliveries
    total_completed = DeliveryAssignmentHistory.objects.filter(delivery_staff=delivery_staff).count()

    # Pending deliveries
    pending_deliveries = DeliveryAssignment.objects.filter(
        delivery_staff=delivery_staff,
        completed_at__isnull=True
    ).select_related('order')

    # Completed deliveries (last 7 days)
    seven_days_ago = timezone.now() - timezone.timedelta(days=7)
    completed_deliveries = DeliveryAssignmentHistory.objects.filter(
        delivery_staff=delivery_staff,
        completed_at__gte=seven_days_ago
    ).select_related('order').order_by('-completed_at')

    # Daily completed deliveries (last 7 days)
    daily_completed = DeliveryAssignmentHistory.objects.filter(
        delivery_staff=delivery_staff,
        completed_at__gte=seven_days_ago
    ).values('completed_at__date').annotate(count=Count('id')).order_by('completed_at__date')

    context = {
        'delivery_staff': delivery_staff,
        'total_completed': total_completed,
        'pending_deliveries': pending_deliveries,
        'completed_deliveries': completed_deliveries,
        'daily_completed': daily_completed,
    }

    return render(request, 'delivery/dashboard.html', context)



class DeliveryGuyDashboardView(LoginRequiredMixin,DeliveryStaffRequiredMixin, ListView):
    template_name = "delivery/delivery_order.html"
    context_object_name = "assignments"
    login_url = "dashboard:sign_in"

    def get_queryset(self):
        return (
            DeliveryAssignment.objects.filter(
                delivery_staff__user=self.request.user,
                order__status=OrderStatus.PENDING
            )
            .select_related("order", "order__user")
            .prefetch_related("order__user__address_set")
        )



class MarkDeliveryCompleteView(LoginRequiredMixin, DeliveryStaffRequiredMixin, View):
    def get(self, request, *args, **kwargs):
        assignment_id = kwargs.get('assignment_id')
        assignment = get_object_or_404(
            DeliveryAssignment, id=assignment_id, delivery_staff__user=request.user
        )
        return render(
            request, "delivery/confirm_completion.html", {"assignment": assignment}
        )

    def post(self, request, *args, **kwargs):
        assignment_id = kwargs.get('assignment_id')
        assignment = get_object_or_404(
            DeliveryAssignment, id=assignment_id, delivery_staff__user=request.user
        )
        try:
            assignment.mark_completed()
            messages.success(
                request, f"Order #{assignment.order.id} has been marked as delivered and you are now available for new deliveries."
            )
        except Exception as e:
            messages.error(request, f"An error occurred while marking the delivery as complete: {str(e)}")
        return redirect("delivery:delivery_guy_dashboard")

class DeliveryHistoryReportView(DeliveryStaffRequiredMixin, LoginRequiredMixin, ListView):
    model = DeliveryAssignmentHistory
    template_name = 'delivery/delivery_history_report.html'
    context_object_name = 'delivery_histories'

    def get_queryset(self):
        queryset = super().get_queryset()
        
        # Get the delivery staff
        try:
            delivery_staff = DeliveryStaff.objects.get(user=self.request.user)
            queryset = queryset.filter(delivery_staff=delivery_staff)
        except DeliveryStaff.DoesNotExist:
            return DeliveryAssignmentHistory.objects.none()

        # Search by Order ID
        order_id = self.request.GET.get('order_id')
        if order_id:
            queryset = queryset.filter(order__id=order_id)
        
        # Date filtering
        start_date = self.request.GET.get('start_date')
        end_date = self.request.GET.get('end_date')
        if start_date:
            start_date = parse_datetime(start_date)
            if start_date:
                queryset = queryset.filter(assigned_at__gte=start_date)
        if end_date:
            end_date = parse_datetime(end_date)
            if end_date:
                # Adjust end_date to the last second of the day (23:59:59)
                end_date = end_date.replace(hour=23, minute=59, second=59, microsecond=999999)
                queryset = queryset.filter(assigned_at__lte=end_date)
        
        # Sorting
        sort_by = self.request.GET.get('sort_by', 'new')  # Default to 'new' for latest data on top
        if sort_by == 'new':
            queryset = queryset.order_by('-assigned_at')
        elif sort_by == 'old':
            queryset = queryset.order_by('assigned_at')
        else:
            # Default sorting (latest first) if 'sort_by' is not 'new' or 'old'
            queryset = queryset.order_by('-assigned_at')
        
        return queryset
