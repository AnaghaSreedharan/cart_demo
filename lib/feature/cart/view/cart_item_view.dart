import 'package:cart_demo/feature/cart/view/cart_details_view.dart';
import 'package:cart_demo/model/cart_model.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.cart}) : super(key: key);
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartItemDetailPage(cart: cart),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Products: ${cart.totalProducts}'),
              Text('ID: ${cart.id}'),
              Text('Total: ${cart.total}'),
              Text('User ID: ${cart.userId}'),
            ],
          ),
        ),
      ),
    );
  }
}
