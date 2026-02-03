import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/routes.dart';
import '../widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
     {"name": "Vegetables", "color": Color(0xFFE6F2EA), "icon": Icons.eco},
     {"name": "Fruits", "color": Color(0xFFFFE9E5), "icon": Icons.apple},
     {"name": "Beverages", "color": Color(0xFFFFF6E3), "icon": Icons.local_drink},
     {"name": "Grocery", "color": Color(0xFFE8F5E9), "icon": Icons.shopping_basket},
     {"name": "Edible oil", "color": Color(0xFFE0F7FA), "icon": Icons.opacity},
     {"name": "Household", "color": Color(0xFFF3E5F5), "icon": Icons.home},
     {"name": "Babycare", "color": Color(0xFFE1F5FE), "icon": Icons.child_care},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Categories",
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textMain,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 15.h,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return CategoryCard(
              name: categories[index]["name"],
              color: categories[index]["color"],
              icon: categories[index]["icon"],
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.produce,
                  arguments: categories[index]["name"],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
