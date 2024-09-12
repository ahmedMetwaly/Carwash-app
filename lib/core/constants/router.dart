import 'package:carwashapp/features/home/presentation/pages/pick_car_screen.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/first_time_opened/presentation/pages/first_time_opened.dart';
import '../../features/auth/presentation/pages/login/presentation/pages/login.dart';
import '../../features/auth/presentation/pages/onboarding/onboarding.dart';
import '../../features/auth/presentation/pages/signup/presentation/screens/forget_password.dart';
import '../../features/auth/presentation/pages/signup/presentation/screens/reset_email.dart';
import '../../features/auth/presentation/pages/signup/presentation/screens/verfy_email.dart';
import '../../features/auth/presentation/pages/signup/presentation/screens/signup.dart';
import '../../features/auth/presentation/pages/splash_screen/splash_screen.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/main_page.dart';
import '../../features/home/presentation/pages/profile_page.dart';
import '../../generated/l10n.dart';
import 'routes.dart';

class RoutesGeneratour {
  static Route<dynamic> getRoute(RouteSettings route) {
    switch (route.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.appStarts:
        return MaterialPageRoute(builder: (_) => const AppStarts());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case Routes.verifyEmail:
        return MaterialPageRoute(builder: (_) => const VerifyEmail());
      case Routes.resetEmail:
        return MaterialPageRoute(builder: (_) => const ResetEmail());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      case Routes.logIn:
        return MaterialPageRoute(builder: (_) => const LogIn());
      case Routes.profile:
        return MaterialPageRoute(
            builder: (_) => const ProfileScreen(), settings: route);
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreenBody());
      case Routes.pickCar:
        return MaterialPageRoute(builder: (_) => const PickCarScreen());

      default:
        return unFoundedRoute();
    }
  }

  static Route<dynamic> unFoundedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text(S.current.noRoute)),
              body: Center(child: Text(S.current.noRouteBody)),
            ));
  }
}
