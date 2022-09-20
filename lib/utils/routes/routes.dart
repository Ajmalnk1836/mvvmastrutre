import 'package:flutter/material.dart';
import 'package:mvvmstructre/utils/routes/routes_name.dart';
import 'package:mvvmstructre/view/home_screen.dart';
import 'package:mvvmstructre/view/login_screen.dart';
import 'package:mvvmstructre/view/signup_screen.dart';
import 'package:mvvmstructre/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const Homescreen(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScren(),
        );
      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No routes defines"),
            ),
          );
        });
    }
  }
}
