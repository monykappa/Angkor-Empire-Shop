    
from shared_imports import *
class ProductListView(ListView):
    model = LaptopSpec
    template_name = 'products/products.html'
    context_object_name = 'laptop_specs'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['brands'] = Brand.objects.all()
        context['cpus'] = CpuSpec.objects.all()
        context['gpus'] = GpuSpec.objects.all()
        context['years'] = LaptopSpec.objects.values_list('product__year', flat=True).distinct()

        brand_id = self.request.GET.get('brand')
        cpu_id = self.request.GET.get('cpu')
        gpu_id = self.request.GET.get('gpu')
        year = self.request.GET.get('year')
        top_rated = self.request.GET.get('top_rated')
        price_order = self.request.GET.get('price_order')

        queryset = self.get_queryset()
        if brand_id:
            queryset = queryset.filter(product__brand_id=brand_id)
            context['selected_brand'] = Brand.objects.get(id=brand_id)
        if cpu_id:
            queryset = queryset.filter(cpu_id=cpu_id)
        if gpu_id:
            queryset = queryset.filter(gpu__id=gpu_id)
        if year:
            queryset = queryset.filter(product__year=year)

        # Annotate the queryset with average rating and total reviews
        avg_rating_subquery = ProductRating.objects.filter(product=OuterRef('product_id')).values('product').annotate(avg_rating=Avg('rating')).values('avg_rating')
        total_reviews_subquery = ProductRating.objects.filter(product=OuterRef('product_id')).values('product').annotate(total_reviews=Count('id')).values('total_reviews')

        queryset = queryset.annotate(
            avg_rating=Subquery(avg_rating_subquery),
            total_reviews=Subquery(total_reviews_subquery)
        )

        # Filter by top-rated products if selected
        if top_rated:
            queryset = queryset.filter(avg_rating__gte=4.5)  # Adjust the rating threshold as needed

        # Sort by price if selected
        if price_order == 'low_to_high':
            queryset = queryset.order_by('product__price')  # Use double underscore to reference price in Product model
        elif price_order == 'high_to_low':
            queryset = queryset.order_by('-product__price')  # Use double underscore to reference price in Product model

        context['laptop_specs'] = queryset
        context['products_found'] = queryset.exists()  # Flag to indicate if products are found

        return context


def search_products(request):
    query = request.GET.get('q', '')
    if query:
        try:
            # Filter products
            products = Product.objects.filter(
                Q(name__icontains=query) |
                Q(model__icontains=query) |
                Q(brand__name__icontains=query)
            ).prefetch_related('images').values(
                'id', 'name', 'model', 'brand__name', 'price', 'year'
            )

            # Convert queryset to list and add image URLs and LaptopSpec slugs
            product_list = list(products)
            base_url = settings.MEDIA_URL

            for product in product_list:
                product_instance = Product.objects.get(id=product['id'])
                product['images'] = [
                    {'image': image.image.url} for image in product_instance.images.all()
                ]

                # Get the corresponding LaptopSpec slug
                laptop_spec = LaptopSpec.objects.filter(product=product_instance).first()
                if laptop_spec:
                    product['slug'] = laptop_spec.slug

            return JsonResponse(product_list, safe=False)
        except Exception as e:
            logger.error(f"Error in search_products: {str(e)}", exc_info=True)
            return JsonResponse({'error': 'Internal server error'}, status=500)
    return JsonResponse([], safe=False)

class ProductDetailView(DetailView):
    model = LaptopSpec
    template_name = 'products/products_detail.html'
    context_object_name = 'laptop_spec'
    slug_field = 'slug'
    slug_url_kwarg = 'slug'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        current_laptop = self.object

        # Calculate the average rating
        avg_rating = ProductRating.objects.filter(product=current_laptop.product).aggregate(Avg('rating'))['rating__avg']
        context['avg_rating'] = avg_rating or 0  # Use 0 if there are no ratings
        
        # Get related products
        brand_name = current_laptop.product.brand.name
        related_products = LaptopSpec.objects.filter(product__brand__name=brand_name).exclude(slug=self.kwargs['slug'])[:5]
        context['related_products'] = related_products

        # Get user reviews ordered by newest first
        reviews = ProductRating.objects.filter(product=current_laptop.product).select_related('user').order_by('-created_at')
        context['reviews'] = reviews

        # Calculate the review rating distribution
        rating_distribution = (
            ProductRating.objects
            .filter(product=current_laptop.product)
            .values('rating')
            .annotate(count=Count('rating'))
            .order_by('rating')
        )

        # Ensure all ratings from 1 to 5 are included
        rating_counts = {rating: 0 for rating in range(1, 6)}
        total_reviews = reviews.count()
        
        for item in rating_distribution:
            rating_counts[item['rating']] = item['count']
        
        # Calculate percentages with two decimal places
        rating_percentages = {rating: round((count / total_reviews * 100), 2) if total_reviews > 0 else 0 for rating, count in rating_counts.items()}

        # Prepare data for Plotly
        ratings = list(rating_percentages.keys())
        percentages = list(rating_percentages.values())

        # Create Plotly figure for sideways bar chart
        fig = go.Figure(data=[go.Bar(
            y=[f"{rating} Star{'s' if rating != 1 else ''}" for rating in ratings],
            x=percentages,
            orientation='h',
            marker_color='orange'
        )])

        fig.update_layout(
            title='Rating Distribution',
            xaxis_title='Percentage of Reviews',
            yaxis_title='Rating',
            xaxis=dict(
                tickvals=[0, 20, 40, 60, 80, 100],
                ticktext=['0%', '20%', '40%', '60%', '80%', '100%']
            ),
            bargap=0.2,
            height=400,
            margin=dict(l=50, r=50, t=50, b=50),
        )

        # Convert the figure to HTML
        plot_div = plot(fig, output_type='div', include_plotlyjs=False)
        context['rating_chart'] = plot_div

        # Get top-selling products
        most_ordered_items = OrderHistoryItem.objects.values('product_id').annotate(total_quantity=Sum('quantity')).order_by('-total_quantity')[:8]
        most_ordered_ids = [item['product_id'] for item in most_ordered_items]
        top_selling_products = LaptopSpec.objects.filter(product_id__in=most_ordered_ids)
        context['top_selling_products'] = top_selling_products

        # Get new arrival products
        new_arrivals = LaptopSpec.objects.order_by('-product__created_at')[:8]
        context['new_arrivals'] = new_arrivals

        return context




        
class PublicLaptopSpecListAPIView(generics.ListAPIView):
    queryset = LaptopSpec.objects.all()
    serializer_class = LaptopSpecSerializer
    permission_classes = []


class PublicBrandListAPIView(generics.ListAPIView):
    queryset = Brand.objects.all()
    serializer_class = BrandSerializer
    permission_classes = []  # No special permissions needed

class LaptopSpecListAPIView(generics.ListAPIView):
    queryset = LaptopSpec.objects.all()
    serializer_class = LaptopSpecSerializer
    permission_classes = [IsSuperAdmin]  # Apply the custom permission

class BrandListAPIView(generics.ListAPIView):
    queryset = Brand.objects.all()
    serializer_class = BrandSerializer
    permission_classes = [IsSuperAdmin]  # Apply the custom permission

class LaptopSpecDetailAPIView(generics.RetrieveAPIView):
    queryset = LaptopSpec.objects.all()
    serializer_class = LaptopSpecSerializer
    lookup_field = 'slug'
    permission_classes = [IsSuperAdmin]  # Apply the custom permission

class PublicLaptopSpecDetailAPIView(generics.RetrieveAPIView):
    queryset = LaptopSpec.objects.all()
    serializer_class = LaptopSpecSerializer
    lookup_field = 'slug'
    permission_classes = []  # No special permissions needed

class RecommendedProductsAPIView(APIView):
    permission_classes = [IsSuperAdmin]  # Apply the custom permission

    def get(self, request, slug):
        all_laptops = list(LaptopSpec.objects.exclude(slug=slug))
        if len(all_laptops) > 5:
            recommended_products = random.sample(all_laptops, 5)
        else:
            recommended_products = all_laptops

        serializer = LaptopSpecSerializer(recommended_products, many=True)
        return Response(serializer.data)

class PublicRecommendedProductsAPIView(APIView):
    permission_classes = []  # No special permissions needed

    def get(self, request, slug):
        all_laptops = list(LaptopSpec.objects.exclude(slug=slug))
        if len(all_laptops) > 5:
            recommended_products = random.sample(all_laptops, 5)
        else:
            recommended_products = all_laptops

        serializer = LaptopSpecSerializer(recommended_products, many=True)
        return Response(serializer.data)
