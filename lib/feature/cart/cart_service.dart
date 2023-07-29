import 'package:http/http.dart' as http;

import '../../model/cart_model.dart';

class CartService {
  static const String baseUrl = 'https://dummyjson.com/carts';

  Future<CartModel> fetchCart(int page) async {
    final response = await http.get(Uri.parse('$baseUrl?page=$page'));

    if (response.statusCode == 200) {
      return cartModelFromJson(response.body);
    } else {
      throw Exception('Failed to load cart');
    }
  }
}
