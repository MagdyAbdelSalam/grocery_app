import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/promotion_banner.dart';
import '../widgets/category_list.dart';
import '../widgets/featured_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Light background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeSearchBar(),
              SizedBox(height: 20.h),
              
              const PromotionBanner(),
              SizedBox(height: 20.h),

              const CategoryList(),
              SizedBox(height: 20.h),

              const FeaturedProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
