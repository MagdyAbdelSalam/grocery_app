import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/routes.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  final List<Map<String, dynamic>> categories = const [
    {"name": "Vegetables", "color": Color(0xFFE6F2EA), "icon": Icons.eco},
    {"name": "Fruits", "color": Color(0xFFFFE9E5), "icon": Icons.apple},
    {"name": "Beverages", "color": Color(0xFFFFF6E3), "icon": Icons.local_drink},
    {"name": "Grocery", "color": Color(0xFFE8F5E9), "icon": Icons.shopping_basket},
    {"name": "Edible oil", "color": Color(0xFFE0F7FA), "icon": Icons.opacity},
    {"name": "Household", "color": Color(0xFFF3E5F5), "icon": Icons.home},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.categories);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_forward_ios, size: 16.sp, color: AppColors.textMain),
            ],
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          height: 90.h, // Height for icon + text
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Column(
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                        color: categories[index]["color"],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        categories[index]["icon"],
                        color: AppColors.primary, // Or specific color
                        size: 24.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      categories[index]["name"],
                      style: GoogleFonts.poppins(fontSize: 10.sp, color: AppColors.textLight),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
