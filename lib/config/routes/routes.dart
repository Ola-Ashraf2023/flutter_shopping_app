import 'package:flutter/material.dart';
import 'package:shopping_app/features/login/presentation/pages/login_screen.dart';
import 'package:shopping_app/features/signup/presentation/pages/signup_screen.dart';

import '../../features/home/presentation/pages/home.dart';

class AppRoutes {
  static const String login = "/";
  static const String signUp = "signup";
  static const String home = "home";
}

class Routes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                appBar: AppBar(
                  title: const Text("error"),
                ),
                body: const Center(child: Text("route error"))));
    }
  }
}
