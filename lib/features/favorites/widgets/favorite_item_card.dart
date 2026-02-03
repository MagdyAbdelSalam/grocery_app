import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/product_images.dart';

class FavoriteItemCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const FavoriteItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final bgColor = product['bg'] as Color? ?? Colors.grey[200]!;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r), // Should be 0 if creating a list with dividers, but using cards here
        boxShadow: [
           BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 5),
        ],
      ),
      child: Row(
        children: [
          // Image
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            child: ProductImages.getImageForProduct(product['title']) != null
                ? ClipOval(
                    child: Image.asset(
                      ProductImages.getImageForProduct(product['title'])!,
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(Icons.shopping_bag, color: Colors.white, size: 30.sp),
          ),
          SizedBox(width: 15.w),
          
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${product['price']}",
                  style: GoogleFonts.poppins(fontSize: 14.sp, color: AppColors.primary, fontWeight: FontWeight.w600),
                ),
                Text(
                  product['title'],
                  style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.textMain),
                ),
                Text(
                  product['unit'],
                  style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
          
          // Price / Actions (Simplified as per screenshot, mainly text)
           // Actually screenshot shows Quantity control or price/unit. Let's adding static quantity for now
           Column(
             children: [
                Text(
                  "\$${product['price']}", // Assuming this is total price
                  style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
             ],
           )
        ],
      ),
    );
  }
}
