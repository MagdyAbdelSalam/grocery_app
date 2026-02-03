import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/routes.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Order Success",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
         padding: EdgeInsets.symmetric(horizontal: 30.w),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const Spacer(flex: 2),
             // Success Icon
             Icon(
               Icons.shopping_bag_outlined,
               size: 150.sp,
               color: AppColors.primary,
             ),
             SizedBox(height: 40.h),
             
             Text(
               "Your order was succesfull !",
               style: GoogleFonts.poppins(
                 fontSize: 20.sp,
                 fontWeight: FontWeight.bold,
                 color: AppColors.textMain,
               ),
               textAlign: TextAlign.center,
             ),
             SizedBox(height: 10.h),
             Text(
               "You will get a response within a few minutes.",
               style: GoogleFonts.poppins(
                 fontSize: 16.sp,
                 color: AppColors.textLight,
               ),
               textAlign: TextAlign.center,
             ),
             
             const Spacer(flex: 3),
             
             // Track Order Button
             SizedBox(
               width: double.infinity,
               height: 55.h,
               child: ElevatedButton(
                 onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: AppColors.primary,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                   elevation: 0,
                 ),
                 child: Text(
                   "Track order",
                   style: GoogleFonts.poppins(
                     fontSize: 18.sp, 
                     fontWeight: FontWeight.bold, 
                     color: Colors.white
                   ),
                 ),
               ),
             ),
             SizedBox(height: 40.h),
           ],
         ),
      ),
    );
  }
}
