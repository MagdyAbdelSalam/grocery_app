import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/services/favorites_service.dart';
import '../widgets/favorite_item_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesService = FavoritesService();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorites",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, 
      ),
      backgroundColor: Colors.white,
      body: ValueListenableBuilder<List<Map<String, dynamic>>>(
        valueListenable: favoritesService.favoritesNotifier,
        builder: (context, favorites, _) {
          if (favorites.isEmpty) {
            return Center(
              child: Text("No favorites yet!", style: GoogleFonts.poppins(color: Colors.grey)),
            );
          }
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            itemCount: favorites.length,
            separatorBuilder: (_, __) => Divider(height: 1, color: Colors.grey[200]),
            itemBuilder: (context, index) {
              final product = favorites[index];
              return Dismissible(
                key: Key(product['title']),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20.w),
                  child: Icon(Icons.delete, color: Colors.white, size: 30.sp),
                ),
                onDismissed: (direction) {
                  favoritesService.removeFavorite(product['title']);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${product['title']} removed from favorites")),
                  );
                },
                child: FavoriteItemCard(product: product),
              );
            },
          );
        },
      ),
    );
  }
}
