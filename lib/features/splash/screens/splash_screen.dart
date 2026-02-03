import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/routes.dart';
import '../widgets/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkNavigation();
  }

  Future<void> _checkNavigation() async {
    // Wait for 3 seconds to show Splash UI
    await Future.delayed(const Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTime') ?? true;
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
      if (mounted) Navigator.pushReplacementNamed(context, Routes.auth);
    } else {
      if (isLoggedIn) {
        if (mounted) Navigator.pushReplacementNamed(context, Routes.home);
      } else {
        if (mounted) Navigator.pushReplacementNamed(context, Routes.auth);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Placeholder UI until next step
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SplashBody(),
      ),
    );
  }
}
