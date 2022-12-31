import 'package:flutter/material.dart';
import 'package:madproject/MainScreen/mainScreen.dart';
import 'package:madproject/views/dashboard/dashboard_Screen.dart';
import 'package:madproject/views/login/login.dart';
import 'package:madproject/views/signup/signup.dart';
import '../../views/forgotPass/forgotPassword.dart';
import '../../views/profilepage/profile_screen.dart';
import '../../views/splash/splash_screen.dart';
import 'route_names.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteName.signupScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case RouteName.dashboardScreen:
        return MaterialPageRoute(builder: (_) =>   DashboardScreen());
      case RouteName.forgotpasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case RouteName.profileScreen:
        return MaterialPageRoute(builder: (_)=> ProfileScreen());
      case RouteName.mainScreen:
        return MaterialPageRoute(builder: (_)=> MainScreen());


      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
