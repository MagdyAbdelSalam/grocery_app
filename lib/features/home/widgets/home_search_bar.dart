import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
         color: const Color(0xFFF2F3F2), // Light grey background
         borderRadius: BorderRadius.circular(15.r),
       ),
       child: TextField(
         decoration: InputDecoration(
           hintText: "Search keywords..",
           hintStyle: GoogleFonts.poppins(
             color: const Color(0xFF7C7C7C),
             fontSize: 14.sp,
           ),
           prefixIcon: const Icon(Icons.search, color: Colors.black),
           suffixIcon: const Icon(Icons.tune, color: Colors.black), // Filter icon
           border: InputBorder.none,
           contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
         ),
       ),
    );
  }
}
