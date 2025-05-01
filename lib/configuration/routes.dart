import 'dart:io';

import 'package:go_router/go_router.dart';
import 'package:reservation_booker/features/main_feature/screens/main_screen.dart';

import '../features/authentication_feature/screens/authentication_screen.dart';


class AppRoute {
  static const authenticationScreen = '/authentication-screen';
  static const mainScreen = '/main-screen';


  static final router = GoRouter(initialLocation: mainScreen, routes: [
    GoRoute(
      path: authenticationScreen,
      builder: (context, state) => AuthenticationScreen(),
    ),GoRoute(
      path: mainScreen,
      builder: (context, state) => MainScreen(),
    ),
  ]);
}
