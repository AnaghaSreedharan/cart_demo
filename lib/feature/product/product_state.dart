import 'package:equatable/equatable.dart';

import '../../model/product_model.dart';

class ProductsState extends Equatable {
  final List<Product> products;
  final bool isLoading;
  final bool hasMore;

  const ProductsState({
    required this.products,
    required this.isLoading,
    required this.hasMore,
  });

  @override
  List<Object?> get props => [products, isLoading, hasMore];
}
