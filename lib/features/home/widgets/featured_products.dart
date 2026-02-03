import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/routes.dart';
import 'product_item.dart';

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({super.key});

  final List<Map<String, dynamic>> products = const [
    {"title": "Fresh Peach", "price": "8.00", "unit": "dozen", "bg": Color(0xFFFFCCBC), "isNew": false},
    {"title": "Avocado", "price": "7.00", "unit": "2.0 lbs", "bg": Color(0xFFDCEDC8), "isNew": true},
    {"title": "Pineapple", "price": "9.90", "unit": "1.50 lbs", "bg": Color(0xFFFFF9C4), "isNew": false},
    {"title": "Black Grapes", "price": "7.05", "unit": "5.0 lbs", "bg": Color(0xFFE1BEE7), "discount": "-16%"},
    {"title": "Pomegranate", "price": "2.09", "unit": "1.50 lbs", "bg": Color(0xFFFFCDD2), "isNew": true},
    {"title": "Fresh Broccoli", "price": "3.00", "unit": "1 kg", "bg": Color(0xFFC8E6C9), "isNew": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
             Navigator.pushNamed(context, Routes.produce, arguments: "Featured Products");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured products",
                style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_forward_ios, size: 16.sp, color: AppColors.textMain),
            ],
          ),
        ),
        SizedBox(height: 15.h),
        
        // Grid
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7, // Adjust card ratio
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
          ),
          itemBuilder: (context, index) {
            final p = products[index];
            return ProductItem(
              title: p['title'],
              price: p['price'],
              unit: p['unit'],
              imageUrl: "", // Placeholder
              bgColor: p['bg'],
              isNew: p['isNew'] ?? false,
              discount: p['discount'],
            );
          },
        ),
      ],
    );
  }
}
