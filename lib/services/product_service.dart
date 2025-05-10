import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:mini_shopping_app/models/product_model.dart';

class ProductService {
  Future<ProductList> loadProducts() async {
    try {
      String jsonString = await rootBundle.loadString('assets/json/item.json');
      final jsonResponse = json.decode(jsonString);
      return ProductList.fromJson(jsonResponse);
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
