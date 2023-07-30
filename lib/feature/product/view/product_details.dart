import 'package:cart_demo/utils/constants_text.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../model/product_model.dart';
import '../../../utils/common_widgets.dart';
import '../../../widgets/default_rating_bar_indicator.dart';

class ProductDetails extends StatefulWidget {
  final Product productData;

  const ProductDetails({Key? key, required this.productData}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: boldBodyText(text:productDetails,color: Colors.white),
        ),
        body: SafeArea(
            child:  Column(
              children: [
                Container(
                  height: 280,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      PageView(
                        controller: pageController,
                        children: widget.productData.images.isNotEmpty
                            ? List.generate(
                            widget.productData.images.length,
                                (index) => ClipRRect(
                              clipBehavior: Clip.antiAlias,
                              borderRadius:
                              BorderRadius.circular(0),
                              child: Image.network(
                                widget.productData.images[index]
                                ,
                                fit: BoxFit.cover,
                              ),
                            ))
                            : [
                          Image.network(
                              '', fit: BoxFit.cover)
                        ],
                      ),
                      Visibility(
                        visible: widget.productData.images.length > 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SmoothPageIndicator(
                            count: widget.productData.images.length,
                            effect:  const WormEffect(
                              spacing: 5.0,
                              radius: 5.0,
                              dotWidth: 10.0,
                              dotHeight: 10.0,
                              strokeWidth: 0,
                              dotColor: Colors.grey,
                              activeDotColor: Colors.blue,
                            ),
                            controller: pageController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: boldBodyText(text:
                                  widget.productData.title,fontSize: 22
                                  ),
                                ),
                                Flexible(
                                    flex: 4,
                                    child: DefaultRatingBarIndicator(
                                        rating: widget.productData.rating,
                                        itemCount: 5,
                                        itemSize: 23)
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Text(
                                  '\$${widget.productData.price.toStringAsFixed(2)}',
                                  style: const TextStyle(decoration: TextDecoration.lineThrough,
                                      fontSize: 16),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '\$${widget.productData.discountPercentage.toStringAsFixed(2)}',
                                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                                ),
                              ],
                            ),

                          ],
                        ),
                        const SizedBox(height: 5,),
                        regularBodyText(
                          text:'Stock: ${ widget.productData.stock}' ,
                        ),
                        regularBodyText(
                          text:'Brand: ${ widget.productData.brand}',
                        ),
                        regularBodyText(
                          text:'Category: ${ widget.productData.category}',
                        ),
                        const SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: mediumBodyText(
                            text: 'Description',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: regularBodyText(
                              text:
                              widget.productData.description,
                              fontSize: 14
                          ),
                        ),
                      ]),
                ),

              ],
            )));
  }
}
