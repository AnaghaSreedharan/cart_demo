import 'package:cart_demo/feature/cart/view/cart_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/tab_state.dart';
import '../cart_cubit.dart';

class CartListingView extends StatefulWidget {
  const CartListingView({super.key});

  @override
  CartListingViewState createState() => CartListingViewState();
}

class CartListingViewState extends State<CartListingView> {
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
      context.read<CartTabViewCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartTabViewCubit, TabViewState>(
      builder: (context, state)
      {
        if (state.isLoading && state.data.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text('Error fetching cart. Please try again.'),
          );
        } else{
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return CartItem(cart: state.data[index]);
            },
          );
        }
      },
    );
  }
}
