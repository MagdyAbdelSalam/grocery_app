import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class PromotionBanner extends StatelessWidget {
  const PromotionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        color: const Color(0xFFEBF8EE), // Light green background
        borderRadius: BorderRadius.circular(10.r),
        image: const DecorationImage(
           // Using vegetables placeholder
           image: NetworkImage('https://images.unsplash.com/photo-1518843875459-f738682238a6?auto=format&fit=crop&w=800&q=80'),
           fit: BoxFit.cover,
           opacity: 0.8,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20.w,
            top: 40.h,
            child: SizedBox(
               width: 150.w,
               child: Text(
                 "20% off on your first purchase",
                 style: GoogleFonts.poppins(
                   fontSize: 18.sp,
                   fontWeight: FontWeight.bold,
                   color: Colors.white, // Assuming dark text fits
                 ),
               ),
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 20.w,
            child: Row(
              children: [
                _buildDot(true),
                SizedBox(width: 5.w),
                _buildDot(false),
                SizedBox(width: 5.w),
                _buildDot(false),
              ],
            ),
          )
        ],
      ),
    );
  }

      Widget _buildDot(bool active) {
    return Container(
      width: 7.w,
      height: 7.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? AppColors.primary : Colors.white.withOpacity(0.5),
      ),
    );
  }
}
