import 'package:cart_demo/feature/product/view/product_details.dart';
import 'package:cart_demo/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/common_widgets.dart';
class ProductItem extends StatelessWidget {
   const ProductItem({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(productData: product),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius:
                BorderRadius.circular(4),
                child:
                Image.network(product.thumbnail,fit: BoxFit.fill,height: 90,width: 100,)),
            SizedBox(width: 8,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldBodyText(text:product.title),
                  const SizedBox(height: 4),
                  regularBodyText(text: product.description,maxLines: 2,fontSize: 12),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(decoration: TextDecoration.lineThrough),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '\$${product.discountPercentage.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )


    );
  }
}
