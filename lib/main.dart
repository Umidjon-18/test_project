import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/core/route/routes.dart';
import 'package:test_project/core/singletons/service_locator.dart';
import 'package:test_project/core/utils/enums.dart';
import 'package:test_project/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:test_project/features/auth/presentation/pages/registration_page.dart';
import 'package:test_project/features/navigation/presentation/pages/tabbar_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get navigator => _navigatorKey.currentState!;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthenticationBloc()),
      ],
      child: CupertinoApp(
        title: 'CodeUnion Test',
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => Routes.generateRoutes(settings),
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              switch (state.authenticationStatus) {
                case AuthenticationStatus.authenticated:
                  navigator.popUntil((route) => false);
                  navigator.push(
                    CupertinoPageRoute(
                      builder: (ctx) => const TabbarNavigation(),
                    ),
                  );
                  break;
                case AuthenticationStatus.unauthenticated:
                  navigator.popUntil((route) => false);
                  navigator.push(
                    CupertinoPageRoute(
                      builder: (ctx) => const RegistrationPage(),
                    ),
                  );
                  break;
              }
            },
            child: child,
          );
        },
      ),
    );
  }
}
