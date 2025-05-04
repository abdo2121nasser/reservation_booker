import 'dart:io';

import 'package:go_router/go_router.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/extra_data_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/screens/specialist_detail_screen.dart';
import 'package:reservation_booker/features/main_feature/screens/main_screen.dart';

import '../features/authentication_feature/screens/authentication_screen.dart';

class AppRoute {
  static const authenticationScreen = '/authentication-screen';
  static const mainScreen = '/main-screen';
  static const specialistDetailScreen = '/specialist-detail-screen';

  static final router =
      GoRouter(initialLocation: authenticationScreen, routes: [
    GoRoute(
      path: authenticationScreen,
      builder: (context, state) => const AuthenticationScreen(),
    ),
    GoRoute(
      path: mainScreen,
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: specialistDetailScreen,
      builder: (context, state) {
        final ExtraDataEntity extraData = state.extra as ExtraDataEntity;
        return SpecialistDetailScreen(
        extraDataEntity: extraData,
      );
      },
    ),
  ]);
}

