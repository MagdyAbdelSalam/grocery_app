import 'package:flutter/material.dart';
import '../../features/splash/screens/splash_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/signup_screen.dart';
import '../../features/main_layout/screens/main_layout_screen.dart';
import '../../features/categories/screens/categories_screen.dart';
import '../../features/produce/screens/produce_screen.dart';
import '../../features/produce_details/screens/produce_details_screen.dart';
import '../../features/order_success/screens/order_success_screen.dart';
import '../../features/shopping_cart/screens/shopping_cart_screen.dart';

class Routes {
  const Routes._();

  static const String splash = '/';
  static const String auth = '/auth';
  static const String signup = '/signup';
  static const String home = '/home'; // Main Layout
  static const String categories = '/categories';
  static const String produce = '/produce';
  static const String productDetails = '/product_details';
  static const String orderSuccess = '/order_success';
  static const String shoppingCart = '/shopping_cart';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case auth:
      // Auth is Login for now
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const MainLayoutScreen());
      case categories:
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      case produce:
        final title = settings.arguments as String? ?? "Products";
        return MaterialPageRoute(builder: (_) => ProduceScreen(title: title));
      case productDetails:
        final product = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => ProduceDetailsScreen(product: product));
      case orderSuccess:
        return MaterialPageRoute(builder: (_) => const OrderSuccessScreen());
      case shoppingCart:
        return MaterialPageRoute(builder: (_) => const ShoppingCartScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No Route defined')),
          ),
        );
    }
  }
}
