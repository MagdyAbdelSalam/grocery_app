import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/services/favorites_service.dart';
import '../../../core/services/cart_service.dart';
import '../../../core/routes.dart';
import '../../../core/constants/product_images.dart';
import '../../order_success/screens/order_success_screen.dart';

class ProduceDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProduceDetailsScreen({super.key, required this.product});

  @override
  State<ProduceDetailsScreen> createState() => _ProduceDetailsScreenState();
}

class _ProduceDetailsScreenState extends State<ProduceDetailsScreen> {
  int _quantity = 1;
  final _favoritesService = FavoritesService();

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final bgColor = product['bg'] as Color? ?? Colors.grey[200]!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Image Section
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white, // Lighter background
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
              ),
              child: SafeArea(
                child: Stack(
                  children: [
                     // Back Button
                    Positioned(
                      top: 10.h,
                      left: 20.w,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    // Image
                    Center(
                      child: ProductImages.getImageForProduct(product['title']) != null
                          ? Image.asset(
                              ProductImages.getImageForProduct(product['title'])!,
                              width: 200.w,
                              height: 200.w,
                              fit: BoxFit.contain,
                            )
                          : Icon(Icons.shopping_bag, size: 150.sp, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Details Section
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                         product['title'],
                         style: GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.bold),
                      ),
                       // Favorite Heart
                      ValueListenableBuilder(
                        valueListenable: _favoritesService.favoritesNotifier,
                        builder: (context, _, __) {
                          final isFav = _favoritesService.isFavorite(product['title']);
                          return IconButton(
                            icon: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: isFav ? Colors.red : Colors.grey,
                              size: 30.sp,
                            ),
                            onPressed: () => _favoritesService.toggleFavorite(product),
                          );
                        },
                      ),
                    ],
                  ),
                  Text(
                    "${product['unit']}",
                     style: GoogleFonts.poppins(fontSize: 16.sp, color: Colors.grey),
                  ),
                  SizedBox(height: 20.h),
                  
                  // Price and Quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Row(
                         children: [
                           IconButton(
                             onPressed: () {
                               if(_quantity > 1) setState(() => _quantity--);
                             },
                             icon: Icon(Icons.remove, color: Colors.grey),
                           ),
                           Container(
                             padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                             decoration: BoxDecoration(
                               border: Border.all(color: Colors.grey[300]!),
                               borderRadius: BorderRadius.circular(10.r),
                             ),
                             child: Text(
                               "$_quantity",
                               style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.bold),
                             ),
                           ),
                            IconButton(
                             onPressed: () {
                               setState(() => _quantity++);
                             },
                             icon: Icon(Icons.add, color: AppColors.primary),
                           ),
                         ],
                       ),
                       Text(
                         "\$${product['price']}",
                          style: GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.bold, color: AppColors.textMain),
                       ),
                    ],
                  ),
                  
                  SizedBox(height: 20.h),
                  
                  // Description Label
                  Text(
                    "Product Description",
                     style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.h),
                  
                  // Scrollable Description
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing",
                         style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.grey, height: 1.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Sticky Bottom Button
          Container(
            padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 30.h), // Extra padding for bottom safe area visual
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              height: 55.h,
              child: ElevatedButton(
                onPressed: () {
                  // Add to cart
                  CartService().addToCart(product, _quantity);
                  
                  // Navigate to Shopping Cart
                  Navigator.pushNamed(context, Routes.shoppingCart);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                  elevation: 0,
                ),
                child: Text(
                  "Add to cart",
                   style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
