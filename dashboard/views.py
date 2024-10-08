from shared_imports import *


class RevenueByDateChartView(View):
    def get(self, request, *args, **kwargs):
        period = request.GET.get("period", "7_days")  # Default to '7_days' if not provided

        # Determine the start date based on the period
        if period == "7_days":
            start_date = now() - timedelta(days=7)
        elif period == "1_month":
            start_date = now() - timedelta(days=30)
        elif period == "1_year":
            start_date = now() - timedelta(days=365)
        else:
            start_date = None

        # Fetch OrderHistory entries based on the period
        if start_date:
            orders = OrderHistory.objects.filter(ordered_date__gte=start_date)
        else:
            orders = OrderHistory.objects.all()

        # Convert the queryset to a list of dictionaries
        data = list(orders.values("ordered_date", "total_price"))

        # Create a DataFrame from the data
        df = pd.DataFrame(data)

        if df.empty:
            return JsonResponse({'chart': {}}, safe=False)

        # Ensure 'ordered_date' is a datetime column
        df["ordered_date"] = pd.to_datetime(df["ordered_date"])

        # Extract date only (removing time part) and calculate total revenue per date
        df["date"] = df["ordered_date"].dt.date
        df_revenue = df.groupby("date")["total_price"].sum().reset_index()

        # Prepare data for Plotly
        plot_data = {"Date": df_revenue["date"], "Total Revenue": df_revenue["total_price"]}
        plot_df = pd.DataFrame(plot_data)

        # Create the line chart with smooth curves and dots
        fig = px.line(
            plot_df,
            x="Date",
            y="Total Revenue",
            title="Total Revenue by Date",
            markers=True,
        )

        # Update traces to add smooth curve and dots
        fig.update_traces(
            mode="lines+markers",  # Show both lines and markers (dots)
            marker=dict(
                size=8,
                color="rgba(0, 128, 0, .8)",
                line=dict(width=2, color="DarkSlateGrey"),
            ),
            line=dict(
                shape='spline',  # Smooth line
                color="rgba(0, 0, 255, 0.8)",  # Line color
                width=2  # Line width
            ),
            fill="tozeroy",  # Fill the area under the line
            fillcolor="rgba(200, 255, 200, 0.4)",
        )

        # Calculate max revenue and set y-axis range with a buffer
        max_revenue = df_revenue["total_price"].max()
        y_max = max_revenue + 500  # Buffer of 500

        fig.update_layout(
            yaxis=dict(
                range=[0, y_max]  # Set the y-axis range with buffer
            ),
            title_x=0.5  # Center the title
        )

        # Convert the Plotly figure to JSON
        chart_json = fig.to_json()

        return JsonResponse({'chart': chart_json})


class OrdersByDateChartsView(View):
    def get(self, request, *args, **kwargs):
        period = request.GET.get("period", "all")  # 'all', '7_days', or '1_month'

        # Fetch OrderHistory entries based on the period
        if period == "7_days":
            start_date = now() - timedelta(days=7)
            orders = OrderHistory.objects.filter(ordered_date__gte=start_date)
        elif period == "1_month":
            start_date = now() - timedelta(days=30)
            orders = OrderHistory.objects.filter(ordered_date__gte=start_date)
        else:
            orders = OrderHistory.objects.all()

        # Convert the queryset to a list of dictionaries
        data = list(orders.values("ordered_date"))

        # Create a DataFrame from the data
        df = pd.DataFrame(data)

        # Ensure 'ordered_date' is a datetime column
        df["ordered_date"] = pd.to_datetime(df["ordered_date"])

        # Extract date only (removing time part) and count occurrences
        df["date"] = df["ordered_date"].dt.date
        df_counts = df["date"].value_counts().sort_index()

        # Prepare data for Plotly
        plot_data = {"Date": df_counts.index, "Number of Orders": df_counts.values}
        plot_df = pd.DataFrame(plot_data)

        # Create the line chart with a curved line
        fig = px.line(
            plot_df,
            x="Date",
            y="Number of Orders",
            title="Number of Orders",
            markers=True,
        )

        # Add dots with order count annotations and shaded area below the line
        fig.update_traces(
            mode="lines+markers+text",
            text=plot_df["Number of Orders"],
            textposition="top center",
            marker=dict(
                size=8,
                color="rgba(255, 0, 5, 1)",
                line=dict(width=2, color="DarkSlateGrey"),
            ),
            line=dict(
                shape="spline",  # Make the line curved
                width=2
            ),
            fill="tozeroy",  # Fill the area under the line
            fillcolor="rgba(255, 133, 0, 0.43)",
        )  # Customize the fill color and opacity

        # Convert the Plotly figure to JSON
        chart_json = fig.to_json()

        return JsonResponse({'chart': chart_json})

class TopProductsChartView(View):
    def get(self, request, *args, **kwargs):
        period = request.GET.get("period", "all")  # 'all', '7_days', '1_month', or 'this_year'
        
        # Fetch OrderHistoryItem entries based on the period
        if period == "7_days":
            start_date = now() - timedelta(days=7)
            items = OrderHistoryItem.objects.filter(order_history__ordered_date__gte=start_date)
        elif period == "1_month":
            start_date = now() - timedelta(days=30)
            items = OrderHistoryItem.objects.filter(order_history__ordered_date__gte=start_date)
        elif period == "this_year":
            start_date = now().replace(month=1, day=1, hour=0, minute=0, second=0, microsecond=0)
            items = OrderHistoryItem.objects.filter(order_history__ordered_date__gte=start_date)
        else:
            items = OrderHistoryItem.objects.all()

        # Aggregate and count products by date
        product_counts = (
            items.values('order_history__ordered_date', 'product__name')
            .annotate(count=Count('product'))
            .order_by('order_history__ordered_date', 'product__name')
        )

        # Convert to DataFrame
        df = pd.DataFrame(list(product_counts))
        
        if df.empty:
            return JsonResponse({'error': 'No data available for the selected period'})
        
        # Get the top 5 products based on total counts
        top_products = (
            df.groupby('product__name')['count']
            .sum()
            .nlargest(5)
            .index
        )
        
        # Filter data to include only the top 5 products
        df_top_products = df[df['product__name'].isin(top_products)]
        
        # Convert date to week for grouping
        df_top_products['week'] = pd.to_datetime(df_top_products['order_history__ordered_date']).dt.to_period('W').apply(lambda r: r.start_time)
        
        # Group by week and product, sum the counts
        df_weekly = df_top_products.groupby(['week', 'product__name'])['count'].sum().reset_index()
        
        # Pivot DataFrame to have weeks as index and products as columns
        df_pivot = df_weekly.pivot_table(index='week', columns='product__name', values='count', fill_value=0)
        
        # Create Plotly figure
        fig = go.Figure()

        # Add lines for top 5 products with dots
        for product in df_pivot.columns:
            fig.add_trace(
                go.Scatter(
                    x=df_pivot.index,
                    y=df_pivot[product],
                    mode='lines+markers',
                    line=dict(shape='spline', width=4),  # Curved lines
                    marker=dict(size=8, symbol='circle'),  # Adjust size and symbol for markers
                    name=product
                )
            )

        # Customize chart appearance
        fig.update_layout(
            xaxis_title='Week',
            yaxis_title='Number of Orders',
            title=dict(text='Top 5 Products Order Count by Week', x=0.5, xanchor='center'),
            legend_title='Products',
            hovermode='x unified'
        )

        # Adjust x-axis tick labels to show exactly 4 weeks
        week_dates = df_pivot.index
        if len(week_dates) >= 4:
            # If there are 4 or more weeks, show ticks for exactly 4 weeks
            tick_vals = week_dates[::len(week_dates)//4]
        else:
            # If there are fewer than 4 weeks, show all weeks
            tick_vals = week_dates
        
        tick_text = [date.strftime('%Y-%m-%d') for date in tick_vals]
        
        fig.update_xaxes(
            tickmode='array',
            tickvals=tick_vals,
            ticktext=tick_text
        )

        # Convert the Plotly figure to JSON
        chart_json = fig.to_json()

        return JsonResponse({'chart': chart_json})

    

class UsersChartsView(View):
    def get(self, request, *args, **kwargs):
        period = request.GET.get("period", "all")  # 'all', '7_days', or '1_month'

        # Fetch User entries based on the period
        if period == "7_days":
            start_date = now() - timedelta(days=7)
            users = User.objects.filter(date_joined__gte=start_date)
        elif period == "1_month":
            start_date = now() - timedelta(days=30)
            users = User.objects.filter(date_joined__gte=start_date)
        else:
            users = User.objects.all()

        # Convert the queryset to a list of dictionaries
        data = list(users.values("date_joined"))

        # Create a DataFrame from the data
        df = pd.DataFrame(data)

        # Ensure 'date_joined' is a datetime column
        df["date_joined"] = pd.to_datetime(df["date_joined"])

        # Extract date only (removing time part) and count occurrences
        df["date"] = df["date_joined"].dt.date
        df_counts = df["date"].value_counts().sort_index()

        # Prepare data for Plotly
        plot_data = {"Date": df_counts.index, "Number of Users": df_counts.values}
        plot_df = pd.DataFrame(plot_data)

        # Create the line chart with a curved line
        fig = px.line(
            plot_df,
            x="Date",
            y="Number of Users",
            title="Number of Users by Date",
            markers=True,
        )

        # Add dots with user count annotations and shaded area below the line
        fig.update_traces(
            mode="lines+markers+text",
            text=plot_df["Number of Users"],
            textposition="top center",
            marker=dict(
                size=8,
                color="rgba(0, 0, 255, .8)",  # Change marker color to blue
                line=dict(width=2, color="DarkSlateGrey"),
            ),
            line=dict(
                shape="spline",  # Make the line curved
                width=2,
                color="blue"  # Change line color to blue
            ),
            fill="tozeroy",  # Fill the area under the line
            fillcolor="rgba(0, 0, 255, 0.2)",  # Change fill color to light blue
        )  # Customize the fill color and opacity

        # Convert the Plotly figure to JSON
        chart_users_json = fig.to_json()

        return JsonResponse({'chart': chart_users_json})

@login_required
@require_POST
def mark_order_as_read(request):
    order_id = request.POST.get("order_id")
    try:
        order = OrderHistory.objects.get(id=order_id)
        order.read = True
        order.save()
        print(f"Order {order_id} marked as read")  # Add this for debugging
        return JsonResponse({"success": True})
    except OrderHistory.DoesNotExist:
        return JsonResponse({"success": False}, status=404)

class DashboardView(UserPermission, LoginRequiredMixin, TemplateView):
    template_name = "dashboard/dashboard.html"
    login_url = reverse_lazy("dashboard:sign_in")

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        # Total number of products
        context["total_products"] = Product.objects.count()

        # Total number of orders
        context["total_orders"] = OrderHistory.objects.count()

        # Total number of users
        context["total_users"] = User.objects.count()

        # Retrieve the newest product
        newest_product = Product.objects.latest("id")
        context["newest_product_name"] = newest_product.name
        context["newest_product_model"] = newest_product.model
        context["newest_product_year"] = newest_product.year
        
        # Count pending orders
        context["pending_orders"] = OrderHistory.objects.filter(
            status=OrderStatus.PENDING
        ).count()

        # Count orders assigned to delivery (exclude completed deliveries)
        context["assigned_to_delivery"] = DeliveryAssignment.objects.filter(
            completed_at__isnull=True
        ).count()

        # Get top 5 most ordered products with their models, year, and count
        top_products = (
            OrderHistoryItem.objects.values(
                "product__name",
                "product__model",
                "product__description",
                "product__year",
            )
            .annotate(total_ordered=Sum("quantity"))
            .order_by("-total_ordered")[:5]
        )

        # Reverse the order for displaying top 1 at the top
        top_products = list(top_products)[::-1]

        product_info = [
            f"{item['product__name']} - {item['product__model']} - {item['product__description']} ({item['product__year']})"
            for item in top_products
        ]
        quantities = [item["total_ordered"] for item in top_products]

        # Create Plotly bar chart for top products with different colors
        colors = [
            "#1F77B4",
            "#FF7F0E",
            "#2CA02C",
            "#D62728",
            "#9467BD",
        ]  # Example colors
        data = [
            go.Bar(
                x=quantities,  # Use quantities as x-axis (count)
                y=[f"Top {i+1}" for i in range(len(top_products))][::-1],  # Reverse order for y-axis labels
                marker=dict(color=colors),
                orientation="h",  # Horizontal bar chart
                hoverinfo="x+text",  # Show count and text (product details) on hover
                text=product_info,  # Display product details (name, model, description, year)
                textposition="inside",  # Display text inside the bar
                textfont=dict(color="white"),  # Text color
            )
        ]

        layout = go.Layout(
            title="Top 5 Most Ordered Products",
            xaxis=dict(title="Quantity Ordered"),
            yaxis=dict(title="Top Products", automargin=True),
            margin=dict(l=150),  # Adjust left margin to accommodate longer product names
        )

        chart = plot({"data": data, "layout": layout}, output_type="div", include_plotlyjs=False)

        # Indent text under the chart due to its length
        text_under_chart = """
            This bar chart displays the top 5 most ordered products with their models, years, and the quantity ordered for each product.
        """

        context["chart"] = chart
        context["text_under_chart"] = text_under_chart

        # Bar chart for user distribution
        user_counts = User.objects.aggregate(
            super_admin_count=Count("id", filter=Q(is_superuser=True)),
            customer_user_count=Count(
                "id", filter=Q(is_superuser=False, deliverystaff__isnull=True)
            ),
            delivery_staff_count=Count("id", filter=Q(deliverystaff__isnull=False)),
            staff_user_count=Count(
                "id",
                filter=Q(is_staff=True, is_superuser=False, deliverystaff__isnull=True),
            ),
        )

        user_data = [
            go.Bar(
                x=["Super Admin", "Customer", "Delivery", "Staff"],
                y=[
                    user_counts["super_admin_count"],
                    user_counts["customer_user_count"],
                    user_counts["delivery_staff_count"],
                    user_counts["staff_user_count"],
                ],
                marker=dict(color=["#FF9999", "#66B2FF", "#99FF99", "#FFCC99"]),
            )
        ]

        user_layout = go.Layout(
            title="User Distribution", yaxis=dict(title="Number of Users")
        )

        user_chart = plot({"data": user_data, "layout": user_layout}, output_type="div", include_plotlyjs=False)

        context["user_chart"] = user_chart

        top_provinces = (
            OrderHistory.objects.values("order_address__province")
            .annotate(order_count=Count("id"))
            .order_by("-order_count")[:6]
        )

        provinces = [item["order_address__province"] for item in top_provinces]
        order_counts = [item["order_count"] for item in top_provinces]

        # Create Plotly line chart for top 5 provinces
        province_data = [
            go.Scatter(
                x=provinces,
                y=order_counts,
                mode="lines+markers",
                name="Order Count",
                line=dict(color="#17BECF", width=2),
                marker=dict(color="#17BECF", size=8),
            )
        ]

        province_layout = go.Layout(
            title="Top 5 Provinces by Order Count",
            xaxis=dict(title="Province"),
            yaxis=dict(title="Number of Orders"),
            margin=dict(l=50, r=50, b=100, t=100, pad=4),
        )

        province_chart = plot({"data": province_data, "layout": province_layout}, output_type="div", include_plotlyjs=False)

        context["province_chart"] = province_chart

        # Calculate revenue for this week using DataFrame
        start_of_week = now().replace(hour=0, minute=0, second=0, microsecond=0) - timedelta(days=now().weekday())
        end_of_week = start_of_week + timedelta(days=7)

        # Fetch relevant orders
        orders = OrderHistory.objects.filter(
            ordered_date__gte=start_of_week,
            ordered_date__lt=end_of_week
        ).values('total_price', 'ordered_date')

        # Convert to DataFrame
        df = pd.DataFrame(list(orders))

        if not df.empty:
            # Sum up the total revenue for this week
            revenue_this_week = df['total_price'].sum()
        else:
            revenue_this_week = 0

        context["revenue_this_week"] = revenue_this_week

        # Calculate total stock
        total_stock = Product.objects.aggregate(total_stock=Sum('stock'))['total_stock'] or 0
        context["total_stock"] = total_stock

        return context

class DashboardSignInView(LoginView):
    template_name = "dashboard/sign_in.html"
    redirect_authenticated_user = True

    def form_valid(self, form):
        user = form.get_user()
        login(self.request, user)
        return JsonResponse({"success": True, "redirect_url": self.get_success_url()})

    def form_invalid(self, form):
        return JsonResponse(
            {"success": False, "message": "Invalid username or password."}, status=400
        )

    def get_success_url(self):
        if self.request.user.is_authenticated:
            if hasattr(self.request.user, "deliverystaff"):
                return reverse_lazy("delivery:dashboard")
            else:
                return reverse_lazy("dashboard:dashboard")
        return reverse_lazy("dashboard:login")


class DashboardLogoutView(View):
    def get(self, request):
        logout(request)
        return redirect("dashboard:sign_in")


class AdvertisementListView(UserPermission, ListView):
    model = Advertisement
    template_name = "dashboard/ads/advertisement_list.html"
    context_object_name = "advertisements"
    ordering = ["-priority", "-created_at"]
    paginate_by = 10  # Show 10 ads per page


class AdvertisementCreateView(UserPermission, CreateView):
    model = Advertisement
    form_class = AdvertisementForm
    template_name = "dashboard/ads/advertisement_create.html"  # Create this template
    success_url = reverse_lazy("dashboard:advertisement_list")


class AdvertisementUpdateView(UserPermission, SuccessMessageMixin, UpdateView):
    model = Advertisement
    form_class = AdvertisementForm
    template_name = "dashboard/ads/advertisement_form.html"
    success_url = reverse_lazy("dashboard:advertisement_list")
    success_message = "Advertisement updated successfully!"


@method_decorator(csrf_exempt, name="dispatch")
class AdvertisementDeleteView(UserPermission, DeleteView):
    model = Advertisement
    success_url = reverse_lazy("dashboard:advertisement_list")

    def delete(self, request, *args, **kwargs):
        try:
            self.object = self.get_object()
            self.object.delete()
            return JsonResponse({"success": True})
        except Exception as e:
            return JsonResponse({"success": False, "error": str(e)}, status=400)

    def post(self, request, *args, **kwargs):
        return self.delete(request, *args, **kwargs)


class OrderHistoryView(UserPermission, LoginRequiredMixin, ListView):
    model = OrderHistory
    template_name = "dashboard/orders.html"
    context_object_name = "order_histories"
    paginate_by = 10

    def get_queryset(self):
        queryset = OrderHistory.objects.all()

        self.status = self.clean_param("status")
        self.search = self.clean_param("search")
        self.start_date = self.clean_param("start_date")
        self.end_date = self.clean_param("end_date")
        self.sort_by = self.clean_param("sort_by")

        self.filters_applied = False

        if self.status:
            queryset = queryset.filter(status__iexact=self.status)
            self.filters_applied = True
        if self.search:
            queryset = queryset.filter(
                Q(user__username__icontains=self.search)
                | Q(id__icontains=str(self.search))
                | Q(total_price__icontains=self.search)
                | Q(order_address__address1__icontains=self.search)
                | Q(order_address__address2__icontains=self.search)
                | Q(order_address__city__icontains=self.search)
                | Q(order_address__province__icontains=self.search)
                | Q(order_address__phone__icontains=self.search)
            )
            self.filters_applied = True

        if self.start_date:
            try:
                start_date = datetime.strptime(self.start_date, "%Y-%m-%d").date()
                queryset = queryset.filter(ordered_date__gte=start_date)
                self.filters_applied = True
            except ValueError:
                pass
        if self.end_date:
            try:
                end_date = datetime.strptime(self.end_date, "%Y-%m-%d")
                end_date = end_date + timedelta(days=1) - timedelta(seconds=1)
                queryset = queryset.filter(ordered_date__lte=end_date)
                self.filters_applied = True
            except ValueError:
                pass

        if self.sort_by:
            queryset = queryset.order_by(self.sort_by)
            self.filters_applied = True
        else:
            queryset = queryset.order_by("-id")

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["status"] = self.status
        context["search"] = self.search
        context["start_date"] = self.start_date
        context["end_date"] = self.end_date
        context["sort_by"] = self.sort_by
        context["filters_applied"] = self.filters_applied  # Add this line

        context["pending_orders_count"] = OrderHistory.objects.filter(
            status=OrderStatus.PENDING
        ).count()
        context["order_status_choices"] = OrderStatus.choices

        return context

    def get_paginate_by(self, queryset):
        # Disable pagination if filters are applied
        return None if self.filters_applied else self.paginate_by

    def clean_param(self, param_name):
        value = self.request.GET.get(param_name, "")
        if isinstance(value, list):
            value = value[0] if value else ""
        return value.strip()


class OrderStatusUpdateView(LoginRequiredMixin, UserPermission, View):
    def post(self, request, pk):
        order_history = get_object_or_404(OrderHistory, pk=pk)
        new_status = request.POST.get("status")
        if new_status in [OrderStatus.COMPLETED, OrderStatus.CANCELLED]:
            order_history.update_status(new_status)

            # Create a notification for the user
            notification_message = (
                f"Your order #{order_history.id} has been {new_status.lower()}."
            )
            Notification.objects.create(
                user=order_history.user,
                message=notification_message,
                created_at=timezone.now(),
                is_read=False,
            )

            messages.success(
                request, f"Order {order_history.id} has been updated to {new_status}"
            )
        else:
            messages.error(request, "Invalid status")
        return redirect("dashboard:order")


class OrderDetailView(LoginRequiredMixin, UserPermission, DetailView):
    model = OrderHistory
    template_name = "dashboard/order_detail.html"
    context_object_name = "order"
    login_url = reverse_lazy("dashboard:sign_in")

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        order = self.object
        if order.status == OrderStatus.COMPLETED:
            try:
                delivery_assignment = DeliveryAssignment.objects.get(order=order)
                context["delivery_staff"] = delivery_assignment.delivery_staff
                context["delivery_assigned_at"] = delivery_assignment.assigned_at
                context["delivery_completed_at"] = delivery_assignment.completed_at
            except DeliveryAssignment.DoesNotExist:
                context["delivery_staff"] = None
        return context


class ProductListView(UserPermission, ListView):
    model = Product
    template_name = "dashboard/product_list.html"
    context_object_name = "products"
    paginate_by = 10

    def get_queryset(self):
        queryset = Product.objects.all()

        # Filtering
        self.search = self.request.GET.get("search", "")
        self.sort_by = self.request.GET.get("sort_by", "-id")
        self.color = self.request.GET.get("color", "")
        self.brand = self.request.GET.get("brand", "")

        if self.search:
            queryset = queryset.filter(
                Q(name__icontains=self.search)
                | Q(model__icontains=self.search)
                | Q(brand__name__icontains=self.search)
            )

        if self.color:
            queryset = queryset.filter(color__name=self.color)

        if self.brand:
            queryset = queryset.filter(brand__name=self.brand)

        # Sorting
        if self.sort_by:
            queryset = queryset.order_by(self.sort_by)

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["search"] = self.search
        context["sort_by"] = self.sort_by
        context["color"] = self.color
        context["brand"] = self.brand

        context["colors"] = Color.objects.all()
        context["brands"] = Brand.objects.all()

        # Preserve query parameters for pagination
        query_params = self.request.GET.copy()
        if "page" in query_params:
            del query_params["page"]
        context["query_params"] = query_params.urlencode()

        # Add clear filter URL
        context["clear_filter_url"] = reverse("dashboard:product_list")

        return context

class AllProductsAPI(LoginRequiredMixin, View):
    """
    API endpoint to get all products in JSON format.
    Requires user to be logged in.
    """
    def get(self, request, *args, **kwargs):
        products = Product.objects.all().values(
            'id', 'name', 'model', 'brand__name', 'color__name', 'price', 'year', 'warranty_years', 'warranty_months'
        )
        return JsonResponse(list(products), safe=False)


class ProductCreateView(SuperuserRequiredMixin, CreateView):
    model = Product
    form_class = ProductForm
    template_name = "dashboard/add/add_new_product.html"
    success_url = reverse_lazy("dashboard:product_list")

    def get_context_data(self, **kwargs):
        data = super().get_context_data(**kwargs)
        if self.request.POST:
            data["laptopspec_formset"] = LaptopSpecFormSet(self.request.POST)
        else:
            data["laptopspec_formset"] = LaptopSpecFormSet()
        return data

    def form_valid(self, form):
        context = self.get_context_data()
        laptopspec_formset = context["laptopspec_formset"]
        if form.is_valid() and laptopspec_formset.is_valid():
            product_instance = form.save()
            laptopspec_formset.instance = product_instance
            laptopspec_formset.save()

            # Handle multiple file uploads
            images = self.request.FILES.getlist("images[]")
            for image in images:
                ProductImage.objects.create(product=product_instance, image=image)

            return super().form_valid(form)
        else:
            return self.render_to_response(self.get_context_data(form=form))


class ProductUpdateView(SuperuserRequiredMixin, UpdateView):
    model = Product
    form_class = ProductForm
    template_name = "dashboard/edit/edit_product.html"
    success_url = reverse_lazy("dashboard:product_list")

    def get_context_data(self, **kwargs):
        data = super().get_context_data(**kwargs)
        if self.request.POST:
            data["laptopspec_formset"] = LaptopSpecFormSet(
                self.request.POST, instance=self.object
            )
        else:
            data["laptopspec_formset"] = LaptopSpecFormSet(instance=self.object)
        return data

    def form_valid(self, form):
        context = self.get_context_data()
        laptopspec_formset = context["laptopspec_formset"]
        if laptopspec_formset.is_valid():
            response = super().form_valid(form)
            laptopspec_formset.instance = self.object
            laptopspec_formset.save()
            return response
        else:
            return self.form_invalid(form)


class ProductImageDeleteView(SuperuserRequiredMixin, View):
    def post(self, request, *args, **kwargs):
        image_id = kwargs.get("pk")
        image = get_object_or_404(ProductImage, id=image_id)

        try:
            image.image.delete()  # Delete the image file
            image.delete()  # Delete the database record
            return JsonResponse({"success": True})
        except Exception as e:
            return JsonResponse({"success": False, "error": str(e)})


class ProductDeleteView(DeleteView):
    model = Product
    success_url = reverse_lazy("dashboard:product_list")

    def delete(self, request, *args, **kwargs):
        self.object = self.get_object()
        self.object.delete()
        return JsonResponse({"message": "Product deleted"}, status=200)


class GenericModelFormView(SuperuserRequiredMixin, CreateView, UpdateView):
    template_name = "dashboard/add/generic_form.html"

    MODEL_FORM_MAP = {
        "category": (Category, CategoryForm),
        "brand": (Brand, BrandForm),
        "color": (Color, ColorForm),
        "cpubrand": (CpuBrand, CpuBrandForm),
        "gpubrand": (GpuBrand, GpuBrandForm),
        "cpuspec": (CpuSpec, CpuSpecForm),
        "gpuspec": (GpuSpec, GpuSpecForm),
        "memorybrand": (MemoryBrand, MemoryBrandForm),
        "memoryspec": (MemorySpec, MemorySpecForm),
        "storagebrand": (StorageBrand, StorageBrandForm),
        "storagespec": (StorageSpec, StorageSpecForm),
        "displayspec": (DisplaySpec, DisplaySpecForm),
        "resolution": (ResolutionSpec, ResolutionSpecForm),
        "refreshrate": (RefreshRate, RefreshRateForm),
        "portspec": (PortSpec, PortSpecForm),
        "wirelessconnectivity": (WirelessConnectivity, WirelessConnectivityForm),
        "webcamspec": (WebcamSpec, WebcamSpecForm),
        "batteryspec": (BatterySpec, BatterySpecForm),
        "operatingsystem": (OperatingSystem, OperatingSystemForm),
    }

    def dispatch(self, request, *args, **kwargs):
        self.model_name = kwargs.get("model_name")
        self.model, self.form_class = self.MODEL_FORM_MAP.get(
            self.model_name.lower(), (None, None)
        )

        if not self.model or not self.form_class:
            raise Http404("Model not found")

        return super().dispatch(request, *args, **kwargs)

    def get_object(self, queryset=None):
        if "pk" in self.kwargs:
            return get_object_or_404(self.model, pk=self.kwargs["pk"])
        return None

    def get_success_url(self):
        return reverse_lazy("dashboard:display_tables")

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["model_name"] = self.model_name.capitalize()
        return context


class DisplayTablesView(UserPermission, TemplateView):
    template_name = "dashboard/table/tables.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Get instances of all models except LaptopSpec and Product
        context["categories"] = Category.objects.all()
        context["brands"] = Brand.objects.all()
        context["colors"] = Color.objects.all()
        context["cpu_brands"] = CpuBrand.objects.all()
        context["gpu_brands"] = GpuBrand.objects.all()
        context["cpu_specs"] = CpuSpec.objects.all()
        context["gpu_specs"] = GpuSpec.objects.all()
        context["memory_brands"] = MemoryBrand.objects.all()
        context["memory_specs"] = MemorySpec.objects.all()
        context["storage_brands"] = StorageBrand.objects.all()
        context["storage_specs"] = StorageSpec.objects.all()
        context["display_specs"] = DisplaySpec.objects.all()
        context["resolution_specs"] = ResolutionSpec.objects.all()
        context["refreshrates"] = RefreshRate.objects.all()
        context["port_specs"] = PortSpec.objects.all()
        context["wireless_connectivities"] = WirelessConnectivity.objects.all()
        context["webcam_specs"] = WebcamSpec.objects.all()
        context["battery_specs"] = BatterySpec.objects.all()
        context["operating_systems"] = OperatingSystem.objects.all()
        return context


class GenericDeleteView(SuperuserRequiredMixin, View):
    MODEL_MAP = {
        "category": Category,
        "brand": Brand,
        "color": Color,
        "cpubrand": CpuBrand,
        "gpubrand": GpuBrand,
        "cpuspec": CpuSpec,
        "gpuspec": GpuSpec,
        "memorybrand": MemoryBrand,
        "memoryspec": MemorySpec,
        "storagebrand": StorageBrand,
        "storagespec": StorageSpec,
        "displayspec": DisplaySpec,
        "resolutionspec": ResolutionSpec,
        "refreshrate": RefreshRate,
        "portspec": PortSpec,
        "wirelessconnectivity": WirelessConnectivity,
        "webcamspec": WebcamSpec,
        "batteryspec": BatterySpec,
        "operatingsystem": OperatingSystem,
    }

    def post(self, request, *args, **kwargs):
        model_name = kwargs.get("model_name")
        pk = kwargs.get("pk")

        model = self.MODEL_MAP.get(model_name.lower())
        if not model:
            return JsonResponse(
                {"success": False, "message": "Model not found"}, status=404
            )

        try:
            instance = get_object_or_404(model, pk=pk)
            instance.delete()
            return JsonResponse(
                {
                    "success": True,
                    "message": f"{model_name.capitalize()} deleted successfully",
                }
            )
        except Exception as e:
            return JsonResponse({"success": False, "message": str(e)}, status=500)


class EditModelView(SuperuserRequiredMixin, UpdateView):
    template_name = "dashboard/edit/edit_model.html"
    success_url = reverse_lazy("dashboard:display_tables")

    MODEL_FORM_MAP = {
        "category": (Category, CategoryForm),
        "brand": (Brand, BrandForm),
        "color": (Color, ColorForm),
        "cpu_brand": (CpuBrand, CpuBrandForm),
        "gpu_brand": (GpuBrand, GpuBrandForm),
        "cpu_spec": (CpuSpec, CpuSpecForm),
        "gpu_spec": (GpuSpec, GpuSpecForm),
        "memory_brand": (MemoryBrand, MemoryBrandForm),
        "memory_spec": (MemorySpec, MemorySpecForm),
        "storage_brand": (StorageBrand, StorageBrandForm),
        "storage_spec": (StorageSpec, StorageSpecForm),
        "display_spec": (DisplaySpec, DisplaySpecForm),
        "resolution_spec": (ResolutionSpec, ResolutionSpecForm),
        "refresh_rate": (RefreshRate, RefreshRateForm),
        "port_spec": (PortSpec, PortSpecForm),
        "wireless_connectivity": (WirelessConnectivity, WirelessConnectivityForm),
        "webcam_spec": (WebcamSpec, WebcamSpecForm),
        "battery_spec": (BatterySpec, BatterySpecForm),
        "operating_system": (OperatingSystem, OperatingSystemForm),
    }

    def dispatch(self, request, *args, **kwargs):
        model_name = kwargs.get("model")
        self.model, self.form_class = self.MODEL_FORM_MAP.get(model_name, (None, None))

        if not self.model or not self.form_class:
            raise Http404("Model not found")

        return super().dispatch(request, *args, **kwargs)

    def get_object(self, queryset=None):
        return get_object_or_404(self.model, pk=self.kwargs["pk"])

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["model_name"] = self.kwargs.get("model").replace("_", " ").title()
        return context


class AssignOrderView(UserPermission, LoginRequiredMixin, FormView):
    template_name = "dashboard/delivery/assign_order.html"
    form_class = AssignOrderForm
    success_url = reverse_lazy("dashboard:assign_order")

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["assignments"] = (
            DeliveryAssignment.objects.filter(completed_at__isnull=True)
            .select_related("order", "delivery_staff__user")
            .prefetch_related(
                Prefetch("order", queryset=OrderHistory.objects.select_related("user"))
            )
            .order_by("-assigned_at")
        )
        return context

    def test_func(self):
        return self.request.user.is_superuser or self.request.user.is_staff

    @method_decorator(transaction.atomic)
    def form_valid(self, form):
        orders = form.cleaned_data["orders"]
        delivery_staff = form.cleaned_data["delivery_staff"]

        assigned_orders = []
        for order in orders:
            # Check if the order is already assigned
            if hasattr(order, "delivery_assignment"):
                messages.warning(
                    self.request,
                    f"Order #{order.id} is already assigned and was skipped.",
                )
                continue

            # Create the delivery assignment
            DeliveryAssignment.objects.create(
                order=order, delivery_staff=delivery_staff
            )
            assigned_orders.append(order.id)

        # Update delivery staff availability if any orders were assigned
        if assigned_orders:
            delivery_staff.is_available = False
            delivery_staff.save()

            messages.success(
                self.request,
                f"Orders #{', '.join(map(str, assigned_orders))} have been assigned to {delivery_staff.user.username}.",
            )
        else:
            messages.warning(
                self.request,
                "No orders were assigned. They may already be assigned or an error occurred.",
            )

        return super().form_valid(form)

    def form_invalid(self, form):
        messages.error(
            self.request,
            "There was an error in assigning the orders. Please try again.",
        )
        return super().form_invalid(form)


class AssignOrderHistoryListView(UserPermission, LoginRequiredMixin, ListView):
    model = DeliveryAssignment
    template_name = "dashboard/delivery/assign_order_history.html"
    context_object_name = "assignments"
    paginate_by = 10

    def get_queryset(self):
        queryset = DeliveryAssignment.objects.select_related(
            "order__user", "order__order_address", "delivery_staff__user"
        )

        # Search functionality
        self.search_query = self.request.GET.get("search", "")
        if self.search_query:
            queryset = queryset.filter(
                Q(order__id__icontains=self.search_query)
                | Q(order__user__username__icontains=self.search_query)
                | Q(delivery_staff__user__username__icontains=self.search_query)
            )

        # Filter by status
        self.status = self.request.GET.get("status", "")
        if self.status == "completed":
            queryset = queryset.filter(completed_at__isnull=False)
        elif self.status == "pending":
            queryset = queryset.filter(completed_at__isnull=True)

        # Filter by date range
        self.start_date = self.request.GET.get("start_date", "")
        self.end_date = self.request.GET.get("end_date", "")
        if self.start_date:
            start_date = parse_date(self.start_date)
            if start_date:
                queryset = queryset.filter(assigned_at__gte=start_date)
        if self.end_date:
            end_date = parse_date(self.end_date)
            if end_date:
                queryset = queryset.filter(assigned_at__lte=end_date)

        return queryset.order_by("-assigned_at")

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["search_query"] = self.search_query
        context["status"] = self.status
        context["start_date"] = self.start_date
        context["end_date"] = self.end_date

        # Check if search or filters are applied
        if self.search_query or self.status or self.start_date or self.end_date:
            context["is_search_or_filter_applied"] = True
            context["assignments"] = (
                self.get_queryset()
            )  # Get all results without pagination
        else:
            context["is_search_or_filter_applied"] = False

        return context

    def get_paginate_by(self, queryset):
        # Disable pagination if search or filters are applied
        if self.search_query or self.status or self.start_date or self.end_date:
            return None
        return self.paginate_by

    def test_func(self):
        return self.request.user.is_superuser or self.request.user.is_staff


class DeliveryStaffCreateView(UserPermission, LoginRequiredMixin, CreateView):
    model = DeliveryStaff
    form_class = DeliveryStaffCreationForm
    template_name = "delivery/create_delivery_staff.html"
    success_url = reverse_lazy(
        "dashboard:delivery_staff_list"
    )  # Redirect to a page listing all delivery staff members

    def form_valid(self, form):
        # Perform any additional actions if needed
        return super().form_valid(form)


class UserListView(UserPermission, LoginRequiredMixin, ListView):
    model = User
    template_name = "dashboard/user/user_list.html"
    context_object_name = "users"

    def get_queryset(self):
        user_type = self.request.GET.get("user_type", "customers")

        if user_type == "customers":
            queryset = User.objects.filter(
                is_superuser=False, is_staff=False, deliverystaff__isnull=True
            )
        elif user_type == "delivery_staff":
            queryset = DeliveryStaff.objects.select_related("user").all()
        elif user_type == "staff_users":
            queryset = User.objects.filter(
                is_staff=True, is_superuser=False, deliverystaff__isnull=True
            )
        elif user_type == "superusers":
            queryset = User.objects.filter(is_superuser=True)
        else:
            queryset = User.objects.all()

        return self.apply_filters(queryset, user_type)

    def apply_filters(self, queryset, user_type):
        search_query = self.request.GET.get("search")
        start_date = self.request.GET.get("start_date")
        end_date = self.request.GET.get("end_date")
        sort_by = self.request.GET.get("sort_by", "username")
        sort_order = self.request.GET.get("sort_order", "asc")

        if search_query:
            if user_type == "delivery_staff":
                queryset = queryset.filter(
                    Q(user__username__icontains=search_query)
                    | Q(user__email__icontains=search_query)
                    | Q(user__first_name__icontains=search_query)
                    | Q(user__last_name__icontains=search_query)
                    | Q(phone_number__icontains=search_query)
                )
            else:
                queryset = queryset.filter(
                    Q(username__icontains=search_query)
                    | Q(email__icontains=search_query)
                    | Q(first_name__icontains=search_query)
                    | Q(last_name__icontains=search_query)
                )

        if start_date and end_date:
            date_field = (
                "user__date_joined" if user_type == "delivery_staff" else "date_joined"
            )
            queryset = queryset.filter(
                **{f"{date_field}__range": [start_date, end_date]}
            )

        if sort_by in ["username", "email", "first_name", "last_name", "date_joined"]:
            if user_type == "delivery_staff":
                sort_by = f"user__{sort_by}"
            if sort_order == "desc":
                sort_by = f"-{sort_by}"
            queryset = queryset.order_by(sort_by)

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user_type = self.request.GET.get("user_type", "customers")
        context["users"] = self.get_queryset()
        context["user_type"] = user_type
        context["search_query"] = self.request.GET.get("search", "")
        context["sort_by"] = self.request.GET.get("sort_by", "username")
        context["sort_order"] = self.request.GET.get("sort_order", "asc")
        context["start_date"] = self.request.GET.get("start_date", "")
        context["end_date"] = self.request.GET.get("end_date", "")
        return context


class DeliveryStaffUpdateView(UserPermission, LoginRequiredMixin, UpdateView):
    model = DeliveryStaff
    form_class = DeliveryStaffUserForm
    template_name = "dashboard/user/staff_form.html"
    context_object_name = "staff"

    def get_object(self, queryset=None):
        user_id = self.kwargs["pk"]
        user = get_object_or_404(User, pk=user_id)
        staff, created = DeliveryStaff.objects.get_or_create(user=user)
        return staff

    def get_success_url(self):
        return reverse_lazy("dashboard:user_list")


class UserUpdateView(UserPermission, LoginRequiredMixin, UpdateView):
    model = User
    form_class = UserUpdateForm
    template_name = "dashboard/user/user_form.html"
    context_object_name = "user"

    def get_success_url(self):
        return reverse_lazy("dashboard:user_list")

    def dispatch(self, request, *args, **kwargs):
        if not request.user.is_authenticated:
            return self.handle_no_permission()

        self.object = self.get_object()

        if not request.user.is_superuser:
            if self.object.is_superuser:
                return render(request, "dashboard/auth/access_denied.html", status=403)

        return super().dispatch(request, *args, **kwargs)


class AddSuperuserView(SuperuserRequiredMixin, LoginRequiredMixin, CreateView):
    model = User
    form_class = UserAddForm
    template_name = "dashboard/user/add_user.html"
    success_url = reverse_lazy("dashboard:user_list")

    def form_valid(self, form):
        user = form.save(commit=False)
        user.set_password(form.cleaned_data["password"])
        user.is_superuser = form.cleaned_data["is_superuser"]
        user.is_staff = form.cleaned_data["is_staff"]
        user.save()
        return super().form_valid(form)


class StockListView(ListView):
    model = Stock
    template_name = "dashboard/stock.html"
    context_object_name = "stocks"
    paginate_by = 10

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["products"] = Product.objects.all().order_by("name")
        context["search_query"] = self.request.GET.get("search_query")
        context["stock_filter"] = self.request.GET.get("stock_filter")
        context["sort_by"] = self.request.GET.get("sort_by")
        # Determine if filters are applied
        context["filters_applied"] = bool(context["search_query"] or context["stock_filter"] or context["sort_by"])
        return context

    def get_queryset(self):
        queryset = super().get_queryset()
        search_query = self.request.GET.get("search_query")
        stock_filter = self.request.GET.get("stock_filter")
        sort_by = self.request.GET.get("sort_by")

        if search_query:
            queryset = queryset.filter(Q(product__name__icontains=search_query) | Q(product__model__icontains=search_query))

        if stock_filter:
            if stock_filter == "in_stock":
                queryset = queryset.filter(quantity__gt=0)
            elif stock_filter == "out_of_stock":
                queryset = queryset.filter(quantity=0)

        if sort_by:
            if sort_by == "updated_asc":
                queryset = queryset.order_by("updated_at")
            elif sort_by == "updated_desc":
                queryset = queryset.order_by("-updated_at")
            elif sort_by == "name_asc":
                queryset = queryset.order_by("product__name")
            elif sort_by == "name_desc":
                queryset = queryset.order_by("-product__name")
        else:
            queryset = queryset.order_by("product__name")

        return queryset



def check_stock_exists(request):
    if request.method == "GET":
        product_id = request.GET.get("product_id")
        try:
            stock = Stock.objects.get(product_id=product_id)
            return JsonResponse(
                {
                    "exists": True,
                    "product_name": stock.product.name,
                    "product_model": stock.product.model,
                    "product_year": stock.product.year,
                    "current_quantity": stock.quantity,
                }
            )
        except Stock.DoesNotExist:
            return JsonResponse({"exists": False})


def add_stock(request):
    if request.method == "POST":
        form = StockForm(request.POST)
        if form.is_valid():
            product = form.cleaned_data["product"]
            quantity = form.cleaned_data["quantity"]

            stock, created = Stock.objects.get_or_create(product=product)
            stock.quantity += quantity
            stock.save()

            messages.success(
                request,
                f"Stock updated for {product.name}. New quantity: {stock.quantity}.",
            )
        else:
            messages.error(request, "Error adding stock. Please check the form.")
    return redirect(reverse("dashboard:stock_list"))


class StockUpdateView(UpdateView):
    model = Stock
    form_class = EditStockForm
    template_name = "dashboard/edit/edit_stock.html"
    context_object_name = "stock"
    success_url = reverse_lazy(
        "dashboard:stock_list"
    )  # Redirect to the stock list page after successful update

    def get_object(self, queryset=None):
        stock_id = self.kwargs.get("pk")
        return get_object_or_404(Stock, pk=stock_id)

    def form_valid(self, form):
        instance = form.save(commit=False)
        instance.updated_at = timezone.now()
        instance.save()
        return super().form_valid(form)



class ReportsView(TemplateView):
    template_name = 'dashboard/reports.html'
    
class OrderReportView(View):
    def post(self, request, *args, **kwargs):
        period = request.POST.get('reportPeriod')
        export_format = request.POST.get('exportFormat')

        # Determine date range based on period
        if period == 'today':
            start_date = now().date()
            end_date = start_date
        elif period == 'this_week':
            start_date = now().date() - timedelta(days=now().date().weekday())
            end_date = start_date + timedelta(days=6)
        elif period == 'this_month':
            start_date = now().date().replace(day=1)
            end_date = (start_date + timedelta(days=31)).replace(day=1) - timedelta(days=1)
        elif period == 'this_semester':
            month = now().month
            if month in [1, 2, 3, 4, 5, 6]:
                start_date = now().date().replace(month=1, day=1)
                end_date = now().date().replace(month=6, day=30)
            else:
                start_date = now().date().replace(month=7, day=1)
                end_date = now().date().replace(month=12, day=31)
        elif period == 'this_year':
            start_date = now().date().replace(month=1, day=1)
            end_date = now().date().replace(month=12, day=31)
        elif period == 'custom':
            try:
                start_date = datetime.strptime(request.POST.get('custom_start_date'), '%Y-%m-%d').date()
                end_date = datetime.strptime(request.POST.get('custom_end_date'), '%Y-%m-%d').date()
                end_date = datetime.combine(end_date, datetime.max.time())
            except ValueError:
                return JsonResponse({'error': 'Invalid date format'}, status=400)
        else:
            return JsonResponse({'error': 'Invalid period selected'}, status=400)

        # Fetch report data
        reports = OrderHistory.objects.filter(ordered_date__range=[start_date, end_date])

        # Prepare context for template
        context = {
            'reports': reports,
            'start_date': start_date,
            'end_date': end_date
        }

        if export_format == 'pdf':
            # Render data to HTML for PDF export
            html = render_to_string('dashboard/reports/order_report_template.html', context)
            response = HttpResponse(content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="Order_Report.pdf"'
            buffer = BytesIO()
            pisa.CreatePDF(BytesIO(html.encode('utf-8')), dest=buffer)
            response.write(buffer.getvalue())
            return response

        elif export_format == 'excel':
            output = BytesIO()
            workbook = xlsxwriter.Workbook(output)
            worksheet = workbook.add_worksheet()

            # Write headers and data
            worksheet.write(0, 0, 'User')
            worksheet.write(0, 1, 'Order Address')
            worksheet.write(0, 2, 'Ordered Date')
            worksheet.write(0, 3, 'Total Price')
            worksheet.write(0, 4, 'Status')
            worksheet.write(0, 5, 'Payment Method')

            row = 1
            for report in reports:
                worksheet.write(row, 0, str(report.user))
                worksheet.write(row, 1, str(report.order_address))
                worksheet.write(row, 2, str(report.ordered_date))
                worksheet.write(row, 3, str(report.total_price))
                worksheet.write(row, 4, report.status)
                worksheet.write(row, 5, report.payment_method)
                row += 1

            workbook.close()
            output.seek(0)
            response = HttpResponse(output.read(), content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
            response['Content-Disposition'] = 'attachment; filename="Order_Report.xlsx"'
            return response

        elif export_format == 'print':
            # Render HTML for print preview
            html = render_to_string('dashboard/reports/order_report_template.html', context)
            response = HttpResponse(html)
            response['Content-Type'] = 'text/html'
            response['Content-Disposition'] = 'inline; filename="Order_Report.html"'
            return response

        return JsonResponse({'error': 'Invalid export format'}, status=400)
    
    
class GenerateProductReportView(View):
    def post(self, request, *args, **kwargs):
        export_format = request.POST.get('exportFormat')

        # Fetch all product data, sorted by brand
        products = Product.objects.all().order_by('brand__name')

        # Organize products by brand
        product_by_brand = {}
        for product in products:
            brand_name = product.brand.name
            if brand_name not in product_by_brand:
                product_by_brand[brand_name] = []
            product_by_brand[brand_name].append(product)

        if export_format == 'pdf':
            # Render data to HTML for PDF export
            html = render_to_string('dashboard/reports/product_report_template.html', {'product_by_brand': product_by_brand})
            response = HttpResponse(content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="Product Report.pdf"'
            buffer = BytesIO()
            pisa_status = pisa.CreatePDF(BytesIO(html.encode('utf-8')), dest=buffer)
            if pisa_status.err:
                return HttpResponse('Error generating PDF', status=500)
            response.write(buffer.getvalue())
            return response

        elif export_format == 'excel':
            output = BytesIO()
            workbook = xlsxwriter.Workbook(output)
            
            # Create separate sheets for each brand
            brands = Product.objects.values_list('brand__name', flat=True).distinct().order_by('brand__name')
            for brand in brands:
                worksheet = workbook.add_worksheet(brand[:31])  # Sheet names must be <= 31 characters
                
                # Write headers
                worksheet.write(0, 0, 'ID')
                worksheet.write(0, 1, 'Name')
                worksheet.write(0, 2, 'Model')
                worksheet.write(0, 3, 'Price')
                worksheet.write(0, 4, 'Year')
                worksheet.write(0, 5, 'Warranty Months')
                worksheet.write(0, 6, 'Warranty Years')

                row = 1
                brand_products = products.filter(brand__name=brand)
                for product in brand_products:
                    worksheet.write(row, 0, str(product.id))
                    worksheet.write(row, 1, str(product.name))
                    worksheet.write(row, 2, str(product.model))
                    worksheet.write(row, 3, str(product.price))
                    worksheet.write(row, 4, str(product.year))
                    worksheet.write(row, 5, str(product.warranty_months))
                    worksheet.write(row, 6, str(product.warranty_years))

                    row += 1

            workbook.close()
            output.seek(0)
            response = HttpResponse(output.read(), content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
            response['Content-Disposition'] = 'attachment; filename="Product Report.xlsx"'
            return response

        elif export_format == 'print':
            # Render HTML for print preview
            html = render_to_string('dashboard/reports/product_report_template.html', {'product_by_brand': product_by_brand})
            response = HttpResponse(html)
            response['Content-Type'] = 'text/html'
            response['Content-Disposition'] = 'inline; filename="Product Report.html"'
            return response

        return JsonResponse({'error': 'Invalid export format'}, status=400)
    
class GenerateStockReportView(View):
    def post(self, request, *args, **kwargs):
        filter_option = request.POST.get('filterOption', 'all')  # Default to 'all' if not specified
        export_format = request.POST.get('exportFormat', 'pdf')  # Default to 'pdf' if not specified

        # Filter stock data based on the selected option
        if filter_option == 'in_stock':
            stocks = Stock.objects.filter(quantity__gt=0)
        elif filter_option == 'out_of_stock':
            stocks = Stock.objects.filter(quantity=0)
        else:
            stocks = Stock.objects.all()

        # Group by brand
        brand_stock_data = {}
        for stock in stocks:
            brand_name = stock.product.brand.name if stock.product.brand else 'Unknown'
            if brand_name not in brand_stock_data:
                brand_stock_data[brand_name] = []
            brand_stock_data[brand_name].append(stock)

        # Generate report based on export format
        if export_format == 'pdf':
            html = render_to_string('dashboard/reports/stock_report_template.html', {'brand_stock_data': brand_stock_data})
            response = HttpResponse(content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="stock_report.pdf"'
            buffer = BytesIO()
            pisa_status = pisa.CreatePDF(BytesIO(html.encode('utf-8')), dest=buffer)
            if pisa_status.err:
                return HttpResponse("Error generating PDF", status=500)
            response.write(buffer.getvalue())
            return response

        elif export_format == 'excel':
            output = BytesIO()
            workbook = xlsxwriter.Workbook(output)
            worksheet = workbook.add_worksheet()

            # Write headers
            worksheet.write(0, 0, 'Product ID')
            worksheet.write(0, 1, 'Product Name')
            worksheet.write(0, 2, 'Model')
            worksheet.write(0, 3, 'Brand')
            worksheet.write(0, 4, 'Price')
            worksheet.write(0, 5, 'Quantity')
            worksheet.write(0, 6, 'Updated At')

            row = 1
            for stock in stocks:
                worksheet.write(row, 0, stock.product.id)
                worksheet.write(row, 1, stock.product.name)
                worksheet.write(row, 2, stock.product.model)
                worksheet.write(row, 3, stock.product.brand.name if stock.product.brand else 'N/A')
                worksheet.write(row, 4, stock.product.price)
                worksheet.write(row, 5, stock.quantity)
                worksheet.write(row, 6, stock.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
                row += 1

            workbook.close()
            output.seek(0)
            response = HttpResponse(output.read(), content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
            response['Content-Disposition'] = 'attachment; filename="stock_report.xlsx"'
            return response

        elif export_format == 'print':
            return render(request, 'dashboard/reports/stock_report_template.html', {'brand_stock_data': brand_stock_data})


        return HttpResponse("Invalid export format", status=400)

class DeliveryHistoryReportView(View):
    def post(self, request, *args, **kwargs):
        period = request.POST.get('reportPeriod')
        export_format = request.POST.get('exportFormat')
        custom_start_date = request.POST.get('customStartDate')
        custom_end_date = request.POST.get('customEndDate')

        # Determine date range based on period
        if period == 'today':
            start_date = now().date()
            end_date = start_date
        elif period == 'this_week':
            start_date = now().date() - timedelta(days=now().date().weekday())
            end_date = start_date + timedelta(days=6)
        elif period == 'this_month':
            start_date = now().date().replace(day=1)
            end_date = (start_date + timedelta(days=31)).replace(day=1) - timedelta(days=1)
        elif period == 'this_semester':
            month = now().month
            if month in [1, 2, 3, 4, 5, 6]:
                start_date = now().date().replace(month=1, day=1)
                end_date = now().date().replace(month=6, day=30)
            else:
                start_date = now().date().replace(month=7, day=1)
                end_date = now().date().replace(month=12, day=31)
        elif period == 'this_year':
            start_date = now().date().replace(month=1, day=1)
            end_date = now().date().replace(month=12, day=31)
        elif period == 'custom':
            if custom_start_date and custom_end_date:
                start_date = datetime.strptime(custom_start_date, '%Y-%m-%d').date()
                end_date = datetime.strptime(custom_end_date, '%Y-%m-%d').date()
                # Set end_date to the end of the day (23:59:59)
                end_date = datetime.combine(end_date, datetime.max.time())
            else:
                return JsonResponse({'error': 'Custom date range not provided'}, status=400)
        else:
            return JsonResponse({'error': 'Invalid period selected'}, status=400)

        # Fetch report data
        delivery_histories = DeliveryAssignmentHistory.objects.filter(
            assigned_at__range=[start_date, end_date]
        ).select_related('order', 'delivery_staff')

        # Prepare date range string with only date part
        date_range_str = f"{start_date.strftime('%Y-%m-%d')} to {end_date.strftime('%Y-%m-%d')}"

        if export_format == 'pdf':
            # Render data to HTML for PDF export
            html = render_to_string('dashboard/reports/delivery_history_report_template.html', {
                'delivery_histories': delivery_histories,
                'date_range': date_range_str
            })
            response = HttpResponse(content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="Delivery Report.pdf"'
            buffer = BytesIO()
            pisa_status = pisa.CreatePDF(BytesIO(html.encode('utf-8')), dest=buffer)
            if pisa_status.err:
                return HttpResponse("Error generating PDF", status=500)
            response.write(buffer.getvalue())
            return response

        elif export_format == 'excel':
            output = BytesIO()
            workbook = xlsxwriter.Workbook(output)
            worksheet = workbook.add_worksheet()

            # Set up worksheet for landscape orientation
            worksheet.set_landscape()

            # Write headers
            worksheet.write(0, 0, 'Order ID')
            worksheet.write(0, 1, 'Delivery Staff')
            worksheet.write(0, 2, 'Assigned At')
            worksheet.write(0, 3, 'Completed At')
            worksheet.write(0, 4, 'User')
            worksheet.write(0, 5, 'Delivery Address 1')
            worksheet.write(0, 6, 'City')
            worksheet.write(0, 7, 'Province')
            worksheet.write(0, 8, 'Phone')

            # Write date range
            worksheet.write(1, 0, f"Date Range: {date_range_str}")

            row = 2
            for dh in delivery_histories:
                order = dh.order
                address = order.order_address
                worksheet.write(row, 0, order.id)
                worksheet.write(row, 1, dh.delivery_staff.user.username)
                worksheet.write(row, 2, dh.assigned_at.strftime('%Y-%m-%d %H:%M:%S'))
                worksheet.write(row, 3, dh.completed_at.strftime('%Y-%m-%d %H:%M:%S'))
                worksheet.write(row, 4, order.user.username)  # Assuming 'order' has a 'user' field
                worksheet.write(row, 5, address.address1 if address else 'N/A')  # Exclude address2
                worksheet.write(row, 6, address.city if address else 'N/A')
                worksheet.write(row, 7, address.province if address else 'N/A')
                worksheet.write(row, 8, address.phone if address else 'N/A')
                row += 1

            workbook.close()
            output.seek(0)
            response = HttpResponse(output.read(), content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
            response['Content-Disposition'] = 'attachment; filename="Delivery Report.xlsx"'
            return response

        elif export_format == 'print':
            # Render data to HTML for printing
            return render(request, 'dashboard/reports/delivery_history_report_template.html', {
                'delivery_histories': delivery_histories,
                'date_range': date_range_str
            })

        return JsonResponse({'error': 'Invalid export format'}, status=400)

class TotalRevenueReportView(View):
    def post(self, request, *args, **kwargs):
        period = request.POST.get('reportPeriod')
        export_format = request.POST.get('exportFormat')

        # Determine date range based on period
        if period == 'today':
            start_date = now().date()
            end_date = start_date
        elif period == 'this_week':
            start_date = now().date() - timedelta(days=now().date().weekday())
            end_date = start_date + timedelta(days=6)
        elif period == 'this_month':
            start_date = now().date().replace(day=1)
            end_date = (start_date + timedelta(days=31)).replace(day=1) - timedelta(days=1)
        elif period == 'this_semester':
            month = now().month
            if month in [1, 2, 3, 4, 5, 6]:
                start_date = now().date().replace(month=1, day=1)
                end_date = now().date().replace(month=6, day=30)
            else:
                start_date = now().date().replace(month=7, day=1)
                end_date = now().date().replace(month=12, day=31)
        elif period == 'this_year':
            start_date = now().date().replace(month=1, day=1)
            end_date = now().date().replace(month=12, day=31)
        elif period == 'custom':
            start_date = request.POST.get('startDate')
            end_date = request.POST.get('endDate')
            try:
                start_date = datetime.strptime(start_date, '%Y-%m-%d').date()
                end_date = datetime.strptime(end_date, '%Y-%m-%d').date()
                # Set end_date to the end of the day (23:59:59)
                end_date = datetime.combine(end_date, datetime.max.time())
            except ValueError:
                return HttpResponse("Invalid date format", status=400)
        else:
            return HttpResponse("Invalid period selected", status=400)

        # Fetch total revenue data
        orders = OrderHistory.objects.filter(ordered_date__range=[start_date, end_date])
        total_revenue = orders.aggregate(total_revenue=Sum('total_price'))['total_revenue'] or 0

        date_range_str = f"{start_date.strftime('%Y-%m-%d')} to {end_date.strftime('%Y-%m-%d')}"

        if export_format == 'print':
            return render(request, 'dashboard/reports/revenue_report_template.html', {
                'date_range': date_range_str,
                'total_revenue': total_revenue,
                'orders': orders,
                'start_date': start_date.strftime('%Y-%m-%d'),
                'end_date': end_date.strftime('%Y-%m-%d'),
            })

        # Generate report based on export format
        if export_format == 'pdf':
            html = render_to_string('dashboard/reports/revenue_report_template.html', {
                'date_range': date_range_str,
                'total_revenue': total_revenue,
                'orders': orders
            })

            # Convert HTML to PDF
            response = HttpResponse(content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="revenue_report.pdf"'
            buffer = BytesIO()
            pisa_status = pisa.CreatePDF(html, dest=buffer)
            if pisa_status.err:
                return HttpResponse('Error generating PDF', status=500)
            response.write(buffer.getvalue())
            return response

        elif export_format == 'excel':
            output = BytesIO()
            workbook = xlsxwriter.Workbook(output)
            worksheet = workbook.add_worksheet()

            # Write headers
            worksheet.write(0, 0, 'Date Range')
            worksheet.write(1, 0, f"{start_date.strftime('%Y-%m-%d')} to {end_date.strftime('%Y-%m-%d')}")
            worksheet.write(2, 0, 'Total Revenue')
            worksheet.write(2, 1, total_revenue)

            # Write order details
            worksheet.write(4, 0, 'Order ID')
            worksheet.write(4, 1, 'Total Price')
            worksheet.write(4, 2, 'Ordered Date')

            row = 5
            for order in orders:
                # Convert datetime to naive if it has timezone info
                order_date = order.ordered_date.replace(tzinfo=None)
                worksheet.write(row, 0, order.id)
                worksheet.write(row, 1, order.total_price)
                worksheet.write_datetime(row, 2, order_date, workbook.add_format({'num_format': 'yyyy-mm-dd'}))
                row += 1

            workbook.close()
            output.seek(0)
            response = HttpResponse(output.read(), content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
            response['Content-Disposition'] = 'attachment; filename="revenue_report.xlsx"'
            return response

        return HttpResponse("Invalid export format", status=400)
    
    
class UserReportView(View):
    def post(self, request, *args, **kwargs):
        period = request.POST.get('report_period', 'today')
        export_format = request.POST.get('export_format', 'pdf')

        # Determine date range based on the period
        if period == 'today':
            start_date = now().date()
            end_date = start_date
        elif period == '7_days':
            end_date = now().date()
            start_date = end_date - timedelta(days=6)
        elif period == 'this_month':
            start_date = now().date().replace(day=1)
            end_date = (start_date + timedelta(days=31)).replace(day=1) - timedelta(days=1)
        elif period == 'this_semester':
            month = now().month
            if month in [1, 2, 3, 4, 5, 6]:
                start_date = now().date().replace(month=1, day=1)
                end_date = now().date().replace(month=6, day=30)
            else:
                start_date = now().date().replace(month=7, day=1)
                end_date = now().date().replace(month=12, day=31)
        elif period == 'this_year':
            start_date = now().date().replace(month=1, day=1)
            end_date = now().date().replace(month=12, day=31)
        elif period == 'custom':
            start_date_str = request.POST.get('custom_start_date')
            end_date_str = request.POST.get('custom_end_date')
            try:
                start_date = datetime.strptime(start_date_str, '%Y-%m-%d').date()
                end_date = datetime.strptime(end_date_str, '%Y-%m-%d').date()
                end_date = datetime.combine(end_date, datetime.max.time())
            except ValueError:
                return HttpResponse("Invalid date format", status=400)
        else:
            return HttpResponse("Invalid period selected", status=400)

        # Fetch users
        users = User.objects.filter(date_joined__range=[start_date, end_date])
        delivery_staff_dict = {ds.user_id: ds.phone_number for ds in DeliveryStaff.objects.all()}

        # Create DataFrame for report
        data = []
        for user in users:
            phone_number = delivery_staff_dict.get(user.id, 'N/A')
            role = 'Staff' if user.id in delivery_staff_dict else 'Normal'
            if user.is_superuser:
                role = 'Superadmin'
            data.append({
                'ID': user.id,
                'Username': user.username,
                'Email': user.email,
                'Date_Joined': user.date_joined.strftime('%Y-%m-%d'),
                'Role': role,
            })

        df = pd.DataFrame(data)

        # Prepare date range string with only date part
        date_range_str = f"{start_date.strftime('%Y-%m-%d')} to {end_date.strftime('%Y-%m-%d')}"

        if export_format == 'print':
            return render(request, 'dashboard/reports/user_report_template.html', {
                'data': data,
                'start_date': start_date,
                'end_date': end_date,
                'date_range': date_range_str
            })

        # Generate report based on export format
        if export_format == 'pdf':
            html = render_to_string('dashboard/reports/user_report_template.html', {
                'data': data,
                'start_date': start_date,
                'end_date': end_date,
                'date_range': date_range_str
            })
            response = HttpResponse(content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="user_report.pdf"'
            buffer = BytesIO()
            pisa_status = pisa.CreatePDF(BytesIO(html.encode('utf-8')), dest=buffer)
            if pisa_status.err:
                return HttpResponse("Error generating PDF", status=500)
            response.write(buffer.getvalue())
            return response

        elif export_format == 'excel':
            output = BytesIO()
            workbook = xlsxwriter.Workbook(output)
            worksheet = workbook.add_worksheet()

            # Write headers
            worksheet.write(0, 0, 'ID')
            worksheet.write(0, 1, 'Username')
            worksheet.write(0, 2, 'Email')
            worksheet.write(0, 3, 'Date Joined')
            worksheet.write(0, 4, 'Role')

            # Write data
            row = 1
            for item in data:
                worksheet.write(row, 0, item['ID'])
                worksheet.write(row, 1, item['Username'])
                worksheet.write(row, 2, item['Email'])
                worksheet.write(row, 3, item['Date_Joined'])
                worksheet.write(row, 4, item['Role'])
                row += 1

            workbook.close()
            output.seek(0)
            response = HttpResponse(output.read(), content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
            response['Content-Disposition'] = 'attachment; filename="user_report.xlsx"'
            return response

        return HttpResponse("Invalid export format", status=400)