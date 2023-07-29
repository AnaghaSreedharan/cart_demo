import 'package:cart_demo/model/product_model.dart';
import 'package:flutter/material.dart';
class ProductItem extends StatelessWidget {
   const ProductItem({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.thumbnail),
      title: Text(product.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.description),
          SizedBox(height: 4),
          Row(
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(decoration: TextDecoration.lineThrough),
              ),
              SizedBox(width: 8),
              Text(
                '\$${product.discountPercentage.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
