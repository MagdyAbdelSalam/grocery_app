import 'package:flutter/foundation.dart';

class CartService {
  // Singleton pattern
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  // Cart items: List of {product: Map, quantity: int}
  final ValueNotifier<List<Map<String, dynamic>>> cartNotifier = ValueNotifier([]);

  List<Map<String, dynamic>> get cartItems => cartNotifier.value;

  // Add item to cart
  void addToCart(Map<String, dynamic> product, int quantity) {
    final items = List<Map<String, dynamic>>.from(cartNotifier.value);
    
    // Check if item already exists
    final existingIndex = items.indexWhere(
      (item) => item['product']['title'] == product['title']
    );

    if (existingIndex != -1) {
      // Update quantity
      items[existingIndex]['quantity'] += quantity;
    } else {
      // Add new item
      items.add({
        'product': product,
        'quantity': quantity,
      });
    }

    cartNotifier.value = items;
  }

  // Remove item from cart
  void removeFromCart(String productTitle) {
    final items = List<Map<String, dynamic>>.from(cartNotifier.value);
    items.removeWhere((item) => item['product']['title'] == productTitle);
    cartNotifier.value = items;
  }

  // Update quantity
  void updateQuantity(String productTitle, int newQuantity) {
    if (newQuantity <= 0) {
      removeFromCart(productTitle);
      return;
    }

    final items = List<Map<String, dynamic>>.from(cartNotifier.value);
    final index = items.indexWhere(
      (item) => item['product']['title'] == productTitle
    );

    if (index != -1) {
      items[index]['quantity'] = newQuantity;
      cartNotifier.value = items;
    }
  }

  // Clear cart
  void clearCart() {
    cartNotifier.value = [];
  }

  // Get subtotal
  double getSubtotal() {
    double subtotal = 0;
    for (var item in cartNotifier.value) {
      final price = double.tryParse(item['product']['price'].toString()) ?? 0;
      final quantity = item['quantity'] as int;
      subtotal += price * quantity;
    }
    return subtotal;
  }

  // Get shipping (fixed for now)
  double getShipping() {
    return cartNotifier.value.isEmpty ? 0 : 1.6;
  }

  // Get total
  double getTotal() {
    return getSubtotal() + getShipping();
  }

  // Get cart count
  int getCartCount() {
    int count = 0;
    for (var item in cartNotifier.value) {
      count += item['quantity'] as int;
    }
    return count;
  }
}
