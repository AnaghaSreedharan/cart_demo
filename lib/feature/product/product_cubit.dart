import 'package:cart_demo/feature/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/product_model.dart';
import '../../services/remote_service.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductService productService;
  final int pageSize;

  int _currentPage = 1;
  List<Product> _currentProducts = [];
  bool _isLoading = false;
  bool _hasMore = true;

  ProductsCubit({required this.productService, this.pageSize = 10}) : super(ProductsState(products: [], isLoading: false, hasMore: true));

  void fetchProducts() async {
    if (_isLoading || !_hasMore) return;

    _isLoading = true;

    try {
      final newProducts = await productService.fetchProducts(_currentPage);
      _currentProducts.addAll(newProducts);
      _currentPage++;
      _isLoading = false;
      _hasMore = newProducts.length == pageSize;

      emit(ProductsState(products: List.from(_currentProducts), isLoading: _isLoading, hasMore: _hasMore));
    } catch (_) {
      _isLoading = false;
      emit(ProductsState(products: List.from(_currentProducts), isLoading: _isLoading, hasMore: _hasMore));
    }
  }
}
