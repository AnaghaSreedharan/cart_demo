import 'package:cart_demo/feature/cart/cart_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/cart_model.dart';
import 'cart_state.dart';


class CartCubit extends Cubit<CartState> {
  final CartService cartService;
  final int pageSize;

  int _currentPage = 1;
  CartModel? _currentCart;
  bool _isLoading = false;
  bool _hasMore = true;

  CartCubit({required this.cartService, this.pageSize = 10}) : super(CartState(cartModel: null, isLoading: false, hasMore: true));

  void fetchCart() async {
    if (_isLoading || !_hasMore) return;

    _isLoading = true;

    try {
      final cartModel = await cartService.fetchCart(_currentPage);
      _currentCart = cartModel;
      _currentPage++;
      _isLoading = false;
      _hasMore = cartModel.limit > cartModel.carts.length;
      emit(CartState(cartModel: cartModel, isLoading: _isLoading, hasMore: _hasMore));

      // emit(CartState(isLoading: isLoading, hasMore: hasMore));
    } catch (_) {
      _isLoading = false;
      emit(CartState(cartModel: null, isLoading: _isLoading, hasMore: _hasMore));
    }
  }
}
