from shared_imports import *


def compare(request):
    search_query = request.GET.get('search', '')

    products = Product.objects.filter(name__icontains=search_query).prefetch_related(
        Prefetch('images', queryset=ProductImage.objects.all().order_by('id')[:1], to_attr='first_image')
    ) if search_query else Product.objects.none()

    if 'compared_products' not in request.session:
        request.session['compared_products'] = []

    if request.method == 'POST':
        action = request.POST.get('action')
        product_id = request.POST.get('product_id')

        if action == 'add' and product_id:
            if product_id not in request.session['compared_products'] and len(request.session['compared_products']) < 3:
                request.session['compared_products'].append(product_id)
                request.session.modified = True
        elif action == 'remove' and product_id:
            if product_id in request.session['compared_products']:
                request.session['compared_products'].remove(product_id)
                request.session.modified = True
        elif action == 'clear':
            request.session['compared_products'] = []
            request.session.modified = True

    compared_products = Product.objects.filter(id__in=request.session['compared_products']).prefetch_related(
        Prefetch('images', queryset=ProductImage.objects.all().order_by('id')[:1], to_attr='first_image')
    )

    max_compare_limit_reached = len(request.session['compared_products']) >= 3
    context = {
            'search_query': search_query,
            'products': products,
            'compared_products': compared_products,
            'max_compare_limit_reached': max_compare_limit_reached
        }

    if request.headers.get('x-requested-with') == 'XMLHttpRequest':
            # If it's an AJAX request, return only the product list
            html = render_to_string('home/partials/product_list.html', context, request=request)
            return HttpResponse(html)
        
    return render(request, 'home/compare.html', context)



class HomeView(TemplateView):
    template_name = 'home/home.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        # Most ordered items
        most_ordered_items = OrderHistoryItem.objects.values('product_id').annotate(total_quantity=Sum('quantity')).order_by('-total_quantity')[:8]
        most_ordered_ids = [item['product_id'] for item in most_ordered_items]
        
        # Newest products
        newest_products = Product.objects.order_by('-id')[:8]
        
        # Affordable products
        affordable_products = Product.objects.order_by('price')[:8]
        affordable_ids = list(affordable_products.values_list('id', flat=True))
        
        # Top rated products
        top_rated_products = ProductRating.objects.values('product_id').annotate(avg_rating=Avg('rating')).order_by('-avg_rating')[:8]
        top_rated_ids = [pr['product_id'] for pr in top_rated_products]
        
        # Combine and filter unique product IDs
        product_ids = set(
            most_ordered_ids +
            list(newest_products.values_list('id', flat=True)) +
            affordable_ids +
            top_rated_ids
        )
        
        # Fetch unique products with related data
        products = Product.objects.filter(id__in=product_ids).prefetch_related(
            'images',
            Prefetch('laptop_spec', queryset=LaptopSpec.objects.select_related('cpu__cpu_brand', 'storage', 'memory').prefetch_related('gpu__gpu_brand'))
        ).select_related('color')
        
        # Calculate average rating and total reviews for each product
        avg_rating_subquery = ProductRating.objects.filter(product=OuterRef('id')).values('product').annotate(avg_rating=Avg('rating')).values('avg_rating')
        total_reviews_subquery = ProductRating.objects.filter(product=OuterRef('id')).values('product').annotate(total_reviews=Count('id')).values('total_reviews')
        
        products = products.annotate(
            avg_rating=Subquery(avg_rating_subquery),
            total_reviews=Subquery(total_reviews_subquery)
        )

        # Sort products into categories and limit to 8
        most_ordered_products = [p for p in products if p.id in most_ordered_ids][:8]
        top_rated_products_sorted = [p for p in products if p.id in top_rated_ids][:8]
        affordable_products_list = [p for p in products if p.id in affordable_ids][:8]
        
        context['most_ordered_items'] = most_ordered_products
        context['newest_products'] = newest_products
        context['affordable_products'] = affordable_products_list
        context['top_rated_products'] = top_rated_products_sorted
        
        return context
    
# If user is logged in, show home_auth.html
class HomeAuth(LoginRequiredMixin, TemplateView):
    def get(self, request):
        template = 'home/home_auth.html'
        return render(request, template)
    

class AboutUsAPIView(APIView):
    def get(self, request):
        about_content = AboutUs.objects.first()
        if about_content:
            serializer = AboutUsSerializer(about_content)
            return Response(serializer.data)
        return Response(status=status.HTTP_404_NOT_FOUND)

def about_us(request):
    return render(request, 'home/about_us.html')


class ContactUsAPIView(APIView):
    def get(self, request):
        contact_content = ContactUs.objects.first()
        if contact_content:
            serializer = ContactUsSerializer(contact_content)
            return Response(serializer.data)
        return Response(status=status.HTTP_404_NOT_FOUND)

def contact(request):
    return render(request, 'home/contact.html')



class RateProductView(LoginRequiredMixin, CreateView):
    model = ProductRating
    fields = ['rating', 'comment']
    template_name = 'home/rate_products.html'
    success_url = reverse_lazy('home:notifications')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        item_id = self.kwargs['item_id']
        context['item_id'] = item_id
        
        # Fetch the OrderHistoryItem and Product
        order_history_item = get_object_or_404(OrderHistoryItem, id=item_id)
        product = order_history_item.product
        
        # Add product details and images to the context
        context['product'] = product
        context['product_images'] = ProductImage.objects.filter(product=product)
        
        return context

    def form_valid(self, form):
        order_history_item = get_object_or_404(OrderHistoryItem, id=self.kwargs['item_id'])
        if order_history_item.order_history.user != self.request.user:
            return self.handle_no_permission()
        
        form.instance.user = self.request.user
        form.instance.product = order_history_item.product
        form.instance.order_history_item = order_history_item
        
        # Mark the notification as read
        Notification.objects.filter(
            user=self.request.user,
            notification_type='RATE_PRODUCT',
            related_object_id=order_history_item.id
        ).update(is_read=True)
        
        return super().form_valid(form)






    
class NotificationView(LoginRequiredMixin, ListView):
    model = Notification
    template_name = 'profile/notifications.html'
    context_object_name = 'notifications'
    login_url = reverse_lazy('userprofile:sign_in')
    paginate_by = 10

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        notifications = context['notifications']

        for notification in notifications:
            if notification.notification_type == 'RATE_PRODUCT':
                notification.rate_url = reverse('home:rate_product', kwargs={'item_id': notification.related_object_id})
                # Check if the user has already rated the product
                order_history_item = OrderHistoryItem.objects.filter(id=notification.related_object_id).first()
                if order_history_item:
                    notification.is_rated = ProductRating.objects.filter(
                        user=self.request.user,
                        product=order_history_item.product,
                        order_history_item=order_history_item
                    ).exists()
        return context
    
    def get_queryset(self):
        return Notification.objects.filter(user=self.request.user).order_by('-created_at')


@login_required
@require_POST
@csrf_protect
def mark_notification_as_read(request):
    notification_id = request.POST.get('notification_id')
    try:
        notification = Notification.objects.get(id=notification_id, user=request.user)
        notification.is_read = True
        notification.save()
        return JsonResponse({'success': True})
    except Notification.DoesNotExist:
        return JsonResponse({'success': False, 'error': 'Notification not found'}, status=404)
    except Exception as e:
        return JsonResponse({'success': False, 'error': str(e)}, status=500)
    

@login_required
@require_POST
@csrf_protect
def mark_all_notifications_as_read(request):
    try:
        Notification.objects.filter(user=request.user, is_read=False).update(is_read=True)
        return JsonResponse({'success': True})
    except Exception as e:
        return JsonResponse({'success': False, 'error': str(e)}, status=500)


