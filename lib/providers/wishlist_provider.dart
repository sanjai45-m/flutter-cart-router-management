import 'package:flutter/foundation.dart';

import '../models/product.dart';

class WishlistProvider with ChangeNotifier {
  final Set<String> _wishlistItems = {};
  final Map<String, Product> _products = {};

  Set<String> get wishlistItems => {..._wishlistItems};
  Map<String, Product> get products => {..._products};

  int get itemCount => _wishlistItems.length;

  bool isInWishlist(String productId) => _wishlistItems.contains(productId);

  void toggleWishlist(Product product) {
    final productId = product.id;
    if (_wishlistItems.contains(productId)) {
      _wishlistItems.remove(productId);
      _products.remove(productId);
    } else {
      _wishlistItems.add(productId);
      _products[productId] = product;
    }
    notifyListeners();
  }

  void removeFromWishlist(String productId) {
    _wishlistItems.remove(productId);
    _products.remove(productId);
    notifyListeners();
  }

  void clearWishlist() {
    _wishlistItems.clear();
    _products.clear();
    notifyListeners();
  }
}