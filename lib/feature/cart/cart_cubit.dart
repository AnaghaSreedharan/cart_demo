
import '../../services/api_service.dart';
import '../home/tabview_cubit.dart';

class CartTabViewCubit extends TabViewCubit {
  CartTabViewCubit({required ApiService apiService}) : super(apiService: apiService);

  @override
  Future<List<dynamic>> fetchData(int page) async {
    final cart = await apiService.fetchCart(page);
    return cart;
  }
}