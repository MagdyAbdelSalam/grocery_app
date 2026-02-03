import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/services/favorites_service.dart';
import '../../../core/routes.dart';
import '../../../core/constants/product_images.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String price;
  final String unit;
  final String imageUrl; // In real app
  final Color bgColor;
  final bool isNew;
  final String? discount;

  const ProductItem({
    super.key,
    required this.title,
    required this.price,
    required this.unit,
    required this.imageUrl,
    required this.bgColor,
    this.isNew = false,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    // Reconstruct product map for service
    final productMap = {
      "title": title,
      "price": price,
      "unit": unit,
      "bg": bgColor,
       // Add other fields if needed
    };

    return GestureDetector(
      onTap: () {
         Navigator.pushNamed(context, Routes.productDetails, arguments: productMap);
      },
      child: Container(
        width: 160.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Tags (New / Discount) + Heart
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (isNew)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                      decoration: BoxDecoration(color: Color(0xFFFFE0B2), borderRadius: BorderRadius.circular(5.r)),
                       child: Text("NEW", style: GoogleFonts.poppins(fontSize: 10.sp, color: Colors.orange)),
                    )
                  else if (discount != null)
                     Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                      decoration: BoxDecoration(color: Color(0xFFFFCDD2), borderRadius: BorderRadius.circular(5.r)),
                       child: Text(discount!, style: GoogleFonts.poppins(fontSize: 10.sp, color: Colors.red)),
                    )
                  else
                    const SizedBox(),
                  
                  // Heart Logic
                  ValueListenableBuilder(
                    valueListenable: FavoritesService().favoritesNotifier,
                    builder: (context, _, __) {
                      final isFav = FavoritesService().isFavorite(title);
                      return InkWell(
                        onTap: () => FavoritesService().toggleFavorite(productMap),
                        child: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: isFav ? Colors.red : Colors.grey,
                          size: 20.sp,
                        ),
                      );
                    },
                  ),
                ],
              ),
              
              // Image
              Expanded(
                child: Center(
                  child: Container(
                    width: 80.w,
                    height: 80.w,
                    decoration: BoxDecoration(
                      color: bgColor,
                      shape: BoxShape.circle,
                    ),
                    child: ProductImages.getImageForProduct(title) != null
                        ? ClipOval(
                            child: Image.asset(
                              ProductImages.getImageForProduct(title)!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(Icons.shopping_bag, color: Colors.white),
                  ),
                ),
              ),
              
              // Price
              Center(
                child: Text(
                  "\$$price",
                  style: GoogleFonts.poppins(fontSize: 14.sp, color: AppColors.primary, fontWeight: FontWeight.bold),
                ),
              ),
              
              // Title
              Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.textMain),
                ),
              ),
               Center(
                child: Text(
                  unit,
                  style: GoogleFonts.poppins(fontSize: 12.sp, color: AppColors.textLight),
                ),
              ),
              
              Divider(height: 20.h, thickness: 0.5),
              
              // Add to Cart
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shopping_bag_outlined, size: 16.sp, color: AppColors.primary),
                    SizedBox(width: 5.w),
                    Text(
                      "Add to cart",
                      style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w600, color: AppColors.textMain),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
