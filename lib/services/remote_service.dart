import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class ProductService {
  static const String baseUrl = 'https://dummyjson.com/products';
  static const int pageSize = 10; // Number of products to fetch per page

  Future<List<Product>> fetchProducts(int page) async {
    final response = await http.get(Uri.parse('$baseUrl?page=$page&limit=$pageSize'));

    if (response.statusCode == 200) {
      final productModel = productModelFromJson(response.body);
      return productModel.products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
