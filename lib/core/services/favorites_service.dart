import 'package:flutter/material.dart';

class FavoritesService {
  // Singleton pattern
  static final FavoritesService _instance = FavoritesService._internal();
  factory FavoritesService() => _instance;
  FavoritesService._internal();

  // ValueNotifier to listen to changes
  final ValueNotifier<List<Map<String, dynamic>>> favoritesNotifier = ValueNotifier([]);

  // Check if an item is favorite
  bool isFavorite(String title) {
    return favoritesNotifier.value.any((item) => item['title'] == title);
  }

  // Toggle favorite status
  void toggleFavorite(Map<String, dynamic> product) {
    final currentList = List<Map<String, dynamic>>.from(favoritesNotifier.value);
    final index = currentList.indexWhere((item) => item['title'] == product['title']);

    if (index != -1) {
      // Remove
      currentList.removeAt(index);
    } else {
      // Add
      currentList.add(product);
    }
    favoritesNotifier.value = currentList;
  }

  // Remove item directly
  void removeFavorite(String title) {
    final currentList = List<Map<String, dynamic>>.from(favoritesNotifier.value);
    currentList.removeWhere((item) => item['title'] == title);
    favoritesNotifier.value = currentList;
  }
}
