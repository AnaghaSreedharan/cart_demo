import '../../services/api_service.dart';
import '../home/tabview_cubit.dart';

class ProductTabViewCubit extends TabViewCubit {
  ProductTabViewCubit({required ApiService apiService}) : super(apiService: apiService);

  @override
  Future<List<dynamic>> fetchData(int page) async {
    final products = await apiService.fetchProducts(page);
    return products;
  }
}
