import 'dart:io';

import 'package:go_router/go_router.dart';

import '../features/authentication_feature/screens/authentication_screen.dart';


class AppRoute {
  static const authenticationScreen = '/authentication-screen';


  static final router = GoRouter(initialLocation: authenticationScreen, routes: [
    GoRoute(
      path: authenticationScreen,
      builder: (context, state) => AuthenticationScreen(),
    ),
  ]);
}
