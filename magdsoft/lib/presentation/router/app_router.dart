import 'package:flutter/material.dart';
import 'package:magdsoft/presentation/router/App_Routes.dart';
import 'package:magdsoft/presentation/screens/shared/HelpScreen.dart';
import 'package:magdsoft/presentation/screens/shared/HomeScreen.dart';
import 'package:magdsoft/presentation/screens/shared/LoginSreen.dart';
import 'package:magdsoft/presentation/screens/shared/verifyPage.dart';

import '../screens/shared/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Splash_screen());
      case AppRoutes.loginPageRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.verifyPageRoure:
        return MaterialPageRoute(builder: (_) =>  const VerifyScreen());        
         case AppRoutes.helpPageRoute:
        return MaterialPageRoute(builder: (_) =>  const HelpScreen());  
          case AppRoutes.homePageRoute:
        return MaterialPageRoute(builder: (_) =>  const HomeScreen());         
      default:
        return MaterialPageRoute(builder: (_) => const Splash_screen());
    }
  }
}
