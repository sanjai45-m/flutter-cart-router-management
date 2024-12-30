import 'package:flutter/foundation.dart';

import '../data/sample_products.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _items = sampleProducts;

  List<Product> get items => [..._items];

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  List<Product> findByCategory(String category) {
    if (category == 'All') return items;
    return _items.where((product) => product.category == category).toList();
  }

  List<Product> searchProducts(String query) {
    return _items
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()) ||
            product.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}