import 'package:flutter/material.dart';
import 'package:shoppy/core/common/models/product.dart';
import 'package:shoppy/core/common/widgets/empty_products.dart';
import 'package:shoppy/features/products/presentation/widgets/product_card.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.products,
    required this.onScrollEnded,
    required this.isLoading,
  });

  final List<Product> products;
  final VoidCallback onScrollEnded;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    bool isFetchingMore = false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (products.isEmpty && !isLoading)
          EmptyPlaceholder(
            message: "No products found",
            description: "Try searching with different keywords",
            icon: Icons.search_off_rounded,
          ),
        if (products.isNotEmpty)
          Expanded(
            flex: 8,
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification.metrics.pixels ==
                        scrollNotification.metrics.maxScrollExtent &&
                    !isFetchingMore) {
                  isFetchingMore = true;
                  onScrollEnded.call();
                }
                return false;
              },
              child: GridView.builder(
                primary: true,
                padding: EdgeInsets.all(12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length,
                itemBuilder: (_, i) => ProductCard(product: products[i]),
              ),
            ),
          ),
        if (isLoading)
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ),
            ),
          ),
      ],
    );
  }
}
