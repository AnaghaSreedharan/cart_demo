import 'package:cart_demo/feature/product/view/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/remote_service.dart';
import '../product_cubit.dart';
import '../product_state.dart';

class ProductListingView extends StatefulWidget {
  @override
  _ProductListingViewState createState() => _ProductListingViewState();
}

class _ProductListingViewState extends State<ProductListingView> {
  final ProductsCubit _productsCubit = ProductsCubit(productService: ProductService());

  @override
  void initState() {
    super.initState();
    _productsCubit.fetchProducts();
  }

  @override
  void dispose() {
    _productsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listing'),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        bloc: _productsCubit,
        builder: (context, state) {
          final products = state.products;
          return ListView.builder(
            itemCount: products.length + (state.hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < products.length) {
                final product = products[index];
                return ProductItem(product: product);
              } else {
                if (state.isLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.hasMore) {
                  _productsCubit.fetchProducts(); // Fetch more products
                  return SizedBox(); // Empty widget, will be replaced with loading indicator
                } else {
                  return Center(child: Text('No more products'));
                }
              }
            },
          );
        },
      ),
    );
  }
}

