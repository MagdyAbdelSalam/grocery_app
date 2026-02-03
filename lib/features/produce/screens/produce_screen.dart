import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../home/widgets/product_item.dart';

class ProduceScreen extends StatelessWidget {
  final String title;
  
  const ProduceScreen({super.key, required this.title});

  // Mock data reusing the same for now
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
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
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
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             childAspectRatio: 0.65,
             crossAxisSpacing: 15.w,
             mainAxisSpacing: 15.h,
          ),
          itemBuilder: (context, index) {
             final p = products[index];
            return ProductItem(
              title: p['title'],
              price: p['price'],
              unit: p['unit'],
              imageUrl: "", 
              bgColor: p['bg'],
              isNew: p['isNew'] ?? false,
              discount: p['discount'],
            );
          },
        ),
      ),
    );
  }
}
