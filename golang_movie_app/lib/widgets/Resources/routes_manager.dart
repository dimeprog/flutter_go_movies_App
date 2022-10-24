import 'package:complete_advance_flutter/presentation/Resources/strings_manager.dart';
import 'package:complete_advance_flutter/presentation/views/forget%20password/forget_password_view.dart';
import 'package:complete_advance_flutter/presentation/views/login/login_view.dart';
import 'package:complete_advance_flutter/presentation/views/main%20view/main_view.dart';
import 'package:complete_advance_flutter/presentation/views/onboarding/onboarding_view.dart';
import 'package:complete_advance_flutter/presentation/views/register/register_view.dart';
import 'package:complete_advance_flutter/presentation/views/splash/splash_view.dart';
import 'package:complete_advance_flutter/presentation/views/store%20detail/store_details_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoardRoute = '/onboard';
  static const String onLoginRoute = '/login';
  static const String onRegisterRoute = '/register';
  static const String onMainRoute = '/main';
  static const String onForgetPasswordRoute = '/forget_password';
  static const String onStoreDetailsRoute = '/store_details';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.onBoardRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.onLoginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.onRegisterRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.onMainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.onForgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgetPasswordView());
      case Routes.onStoreDetailsRoute:
        return MaterialPageRoute(builder: (_) => StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStringManager.routeNotFound),
        ),
        body: const Center(
          child: Text(AppStringManager.routeNotFound),
        ),
      ),
    );
  }
}
