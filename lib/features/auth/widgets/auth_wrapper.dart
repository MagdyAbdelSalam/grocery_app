import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

class AuthWrapper extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final Widget bottomText;
  final bool showBackButton;

  const AuthWrapper({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    required this.bottomText,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background behind the image
      body: Stack(
        children: [
          // Background Image (Top Half)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 0.5.sh,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  // Using a network placeholder for grocery aisle
                  image: NetworkImage('https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=800&q=80'), 
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.3), // Dark overlay for text readability if needed
              ),
            ),
          ),
          
          // Back Button
          if (showBackButton)
            Positioned(
              top: 50.h,
              left: 20.w,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 18.r,
                  child: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
                ),
              ),
            ),
            
          // Title on Image
          Positioned(
            top: 120.h,
            left: 0,
            right: 0,
            child: Text(
              "Welcome",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Bottom Sheet (White Container)
          Positioned(
            top: 0.45.sh, // Overlap slightly
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F5F9), // Light grey background from screenshot
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textMain,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: AppColors.textLight,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    child, // The form fields
                    SizedBox(height: 20.h),
                    Center(child: bottomText),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
