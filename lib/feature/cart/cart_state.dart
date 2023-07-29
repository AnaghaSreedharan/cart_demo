import 'package:equatable/equatable.dart';

import '../../model/cart_model.dart';

class CartState extends Equatable {
  final CartModel? cartModel;
  final bool isLoading;
  final bool hasMore;

  const CartState({
    this.cartModel,
    required this.isLoading,
    required this.hasMore,
  });

  CartState copyWith({
    CartModel? cartModel,
    bool? isLoading,
    bool? hasMore,
  }) {
    return CartState(
      cartModel: cartModel ?? this.cartModel,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  List<Object?> get props => [cartModel, isLoading, hasMore];
}
