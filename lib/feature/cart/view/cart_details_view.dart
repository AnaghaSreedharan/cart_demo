import 'package:flutter/material.dart';

import '../../../model/cart_model.dart';

class CartItemDetailPage extends StatelessWidget {
  final Cart cart;

  const CartItemDetailPage({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Item Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cart ID: ${cart.id}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('Total Products: ${cart.totalProducts}'),
            Text('Total Quantity: ${cart.totalQuantity}'),
            Text('Total Price: \$${cart.total}'),
            Text('Discounted Total Price: \$${cart.discountedTotal}'),
            const SizedBox(height: 16),
            const Text(
              'Products:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: cart.products.length,
                itemBuilder: (context, index) {
                  final product = cart.products[index];
                  return ProductItemCard(product: product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductItemCard extends StatelessWidget {
  final CartProduct product;

  const ProductItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Price: \$${product.price}'),
            Text('Quantity: ${product.quantity}'),
            Text('Total Price: \$${product.total}'),
            Text('Discount Percentage: ${product.discountPercentage}%'),
            Text('Discounted Price: \$${product.discountedPrice}'),
          ],
        ),
      ),
    );
  }
}
