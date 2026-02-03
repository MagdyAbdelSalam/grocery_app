import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/routes.dart';
import '../widgets/auth_wrapper.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    // Basic validation
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    // Set isLoggedIn
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    
    // Navigate home
    if (mounted) {
       Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      title: "Welcome back !",
      subtitle: "Sign in to your account",
      showBackButton: false, // Root of Auth stack usually
      bottomText: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account ? ",
            style: GoogleFonts.poppins(
               fontSize: 15.sp,
               color: AppColors.textLight,
            ),
          ),
          InkWell(
            onTap: () {
               // Navigate to Signup
               Navigator.pushNamed(context, '/signup'); // Assume route name
            },
            child: Text(
              "Sign up",
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
            hintText: "Email Address",
            icon: Icons.email_outlined,
            controller: _emailController,
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
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                   // Custom Switch/Checkbox
                   Switch(
                     value: _rememberMe,
                     onChanged: (val) => setState(() => _rememberMe = val),
                     activeColor: AppColors.primary,
                     activeTrackColor: AppColors.secondary,
                   ),
                   Text(
                     "Remember me",
                     style: GoogleFonts.poppins(fontSize: 12.sp, color: AppColors.textLight),
                   ),
                ],
              ),
              Text(
                "Forgot password",
                style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.blue), // Blue link
              ),
            ],
          ),
          
          SizedBox(height: 20.h),
          
          PrimaryButton(
            text: "Login",
            onPressed: _login,
          ),
        ],
      ),
    );
  }
}
