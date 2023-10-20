import 'package:flutter/cupertino.dart';
import 'package:test_project/features/auth/presentation/pages/registration_page.dart';
import 'package:test_project/features/navigation/presentation/pages/tabbar_navigation.dart';

class Routes {
  static const registration = '/';
  static const main = '/main';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    try {
      final Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (settings.name) {
        case registration:
          return CupertinoPageRoute(
            settings: const RouteSettings(name: 'Registration Screen'),
            builder: (_) =>  const RegistrationPage(),
          );
        case main:
          return CupertinoPageRoute(
            settings: const RouteSettings(name: 'Main'),
            builder: (_) =>  TabbarNavigation(),
          );
        default:
          return CupertinoPageRoute(
            settings: const RouteSettings(name: 'Profile Screen'),
            builder: (_) =>  Container(),
          );
      }
    } catch (e) {
      return CupertinoPageRoute(
        settings: const RouteSettings(name: 'Splash Screen'),
            builder: (_) =>  Container(),
      );
    }
  }
}
