import 'package:cart_demo/feature/product/product_cubit.dart';
import 'package:cart_demo/feature/product/view/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/tab_state.dart';
class ProductListingView extends StatefulWidget {
  const ProductListingView({super.key});

  @override
  ProductListingViewState createState() => ProductListingViewState();
}

class ProductListingViewState extends State<ProductListingView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
      context.read<ProductTabViewCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductTabViewCubit, TabViewState>(
      builder: (context, state) {
        if (state.isLoading && state.data.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text('Error fetching products. Please try again.'),
          );
        } else {
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return ProductItem(product: state.data[index]);
            },
          );
        }
      },
    );
  }
}