import 'package:flutter/material.dart';
import 'package:magdsoft/presentation/router/App_Routes.dart';
import 'package:magdsoft/presentation/screens/shared/LoginSreen.dart';

import '../screens/shared/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Splash_screen());
      case AppRoutes.loginPageRoute:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());
      default:
        return null;
    }
  }
}
