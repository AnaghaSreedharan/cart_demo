import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'cart_cubit.dart';
import 'cart_service.dart';
import 'cart_state.dart';

class CartListingPage extends StatefulWidget {
  @override
  _CartListingPageState createState() => _CartListingPageState();
}

class _CartListingPageState extends State<CartListingPage> {
  late ScrollController _scrollController;
  final CartCubit _cartCubit = CartCubit(cartService: CartService());

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _cartCubit.fetchCart();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _cartCubit.close();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _cartCubit.fetchCart();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        bloc: _cartCubit,
        builder: (context, cartState) {
          final cartModel = cartState.cartModel;
          if (cartModel == null) {
            return Center(child: Text('Failed to load cart'));
          } else {
            final cart = cartModel.carts.first;
            return ListView.builder(
              controller: _scrollController,
              itemCount: cart.products.length + (cartState.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < cart.products.length) {
                  final product = cart.products[index];
                  return ListTile(
                    title: Text(product.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price: \$${product.price}'),
                        Text('Quantity: ${product.quantity}'),
                        Text('Total: \$${product.total}'),
                        Text('Discounted Price: \$${product.discountedPrice}'),
                      ],
                    ),
                  );
                } else {
                  if (cartState.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (cartState.hasMore) {
                    return Center(
                      child: ElevatedButton(
                        onPressed: () => _cartCubit.fetchCart(),
                        child: Text('Load More'),
                      ),
                    );
                  } else {
                    return Center(child: Text('No more cart items'));
                  }
                }
              },
            );
          }
        },
      ),
    );
  }
}
