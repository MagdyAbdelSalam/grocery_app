import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/services/cart_service.dart';
import '../../../core/constants/product_images.dart';

class CartItemCard extends StatelessWidget {
  final Map<String, dynamic> cartItem;

  const CartItemCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final product = cartItem['product'] as Map<String, dynamic>;
    final quantity = cartItem['quantity'] as int;
    final bgColor = product['bg'] as Color? ?? Colors.grey[200]!;
    final price = double.tryParse(product['price'].toString()) ?? 0;
    final cartService = CartService();

    return Dismissible(
      key: Key(product['title']),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.w),
        color: Colors.red,
        child: Container(
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
            color: Colors.red[700],
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(Icons.delete, color: Colors.white, size: 30.sp),
        ),
      ),
      onDismissed: (direction) {
        cartService.removeFromCart(product['title']);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${product['title']} removed from cart")),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            // Product Image
            Container(
              width: 70.w,
              height: 70.w,
              decoration: BoxDecoration(
                color: bgColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: ProductImages.getImageForProduct(product['title']) != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        ProductImages.getImageForProduct(product['title'])!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Icon(Icons.shopping_bag, size: 35.sp, color: bgColor),
            ),
            SizedBox(width: 15.w),

            // Product Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$${price.toStringAsFixed(2)} x $quantity",
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    product['title'],
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    product['unit'] ?? '',
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Quantity Controls
            Column(
              children: [
                // Plus button
                InkWell(
                  onTap: () {
                    cartService.updateQuantity(product['title'], quantity + 1);
                  },
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      size: 18.sp,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),

                // Quantity
                Text(
                  quantity.toString(),
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),

                // Minus button
                InkWell(
                  onTap: () {
                    cartService.updateQuantity(product['title'], quantity - 1);
                  },
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.remove,
                      size: 18.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
