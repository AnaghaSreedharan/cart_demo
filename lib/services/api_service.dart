import 'package:http/http.dart' as http;

import '../../model/cart_model.dart' ;
import '../../model/product_model.dart';


class ApiService {
  static const String baseUrl = 'https://dummyjson.com';

  Future<List<Product>> fetchProducts(int page) async {
    final response = await http.get(Uri.parse('$baseUrl/products?page=$page'));
    if (response.statusCode == 200) {
      final productModel = productModelFromJson(response.body);
      return productModel.products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Cart>> fetchCart(int page) async {
    final response = await http.get(Uri.parse('$baseUrl/carts?page=$page'));
    if (response.statusCode == 200) {
      final productModel = cartModelFromJson(response.body);
      return productModel.carts;
    } else {
      throw Exception('Failed to load cart');
    }
  }
}
