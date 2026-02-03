import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/routes.dart';
import '../widgets/auth_wrapper.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
   final _emailController = TextEditingController();
   final _phoneController = TextEditingController();
   final _passwordController = TextEditingController();
   bool _obscurePassword = true;

   Future<void> _signup() async {
     // Basic validation
     if (_emailController.text.isEmpty || _phoneController.text.isEmpty || _passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill in all fields')),
        );
        return;
     }

     // Logic: Create account -> Login
     final prefs = await SharedPreferences.getInstance();
     await prefs.setBool('isLoggedIn', true);

     if (mounted) {
       Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
     }
   }

  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      title: "Create account",
      subtitle: "Quickly create account",
      showBackButton: true,
      bottomText: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account ? ",
            style: GoogleFonts.poppins(
               fontSize: 15.sp,
               color: AppColors.textLight,
            ),
          ),
          InkWell(
            onTap: () {
               Navigator.pop(context); // Go back to Login
            },
            child: Text(
              "Login",
              style: GoogleFonts.poppins(
                fontSize: 15.sp,
                color: AppColors.textMain,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          CustomTextField(
            hintText: "Email address",
            icon: Icons.email_outlined,
            controller: _emailController,
          ),
           CustomTextField(
            hintText: "Phone number",
            icon: Icons.phone_outlined,
            controller: _phoneController,
          ),
          CustomTextField(
            hintText: "Password",
            icon: Icons.lock_outline,
            isPassword: _obscurePassword,
            controller: _passwordController,
            suffixIcon: IconButton(
              icon: Icon(
                 _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                 color: Colors.grey[400],
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
           SizedBox(height: 20.h),
          PrimaryButton(
            text: "Signup",
            onPressed: _signup,
          ),
        ],
      ),
    );
  }
}
