import 'package:cart_demo/feature/product/view/product_view.dart';
import 'package:cart_demo/utils/constants_text.dart';
import 'package:flutter/material.dart';
import '../cart/view/cart_view.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(home),
          bottom: const TabBar(
            tabs: [
              Tab(text: products),
              Tab(text: cart),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ProductListingView(),
            CartListingView(),
          ],
        ),
      ),
    );
  }
}
