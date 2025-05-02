import 'dart:io';

import 'package:go_router/go_router.dart';
import 'package:reservation_booker/features/find_specialist_feature/screens/specialist_detail_screen.dart';
import 'package:reservation_booker/features/main_feature/screens/main_screen.dart';

import '../features/authentication_feature/screens/authentication_screen.dart';
import '../features/find_specialist_feature/entities/specialist_entity.dart';

class AppRoute {
  static const authenticationScreen = '/authentication-screen';
  static const mainScreen = '/main-screen';
  static const specialistDetailScreen = '/specialist-detail-screen';

  static final router =
      GoRouter(initialLocation: specialistDetailScreen, routes: [
    GoRoute(
      path: authenticationScreen,
      builder: (context, state) => AuthenticationScreen(),
    ),
    GoRoute(
      path: mainScreen,
      builder: (context, state) => MainScreen(),
    ),
    GoRoute(
      path: specialistDetailScreen,
      builder: (context, state) => SpecialistDetailScreen(
        specialistEntity: x,
      ),
    ),
  ]);
}

var x = SpecialistEntity(
  name: 'Dr. Sarah Johnson',
  category: 'Therapy',
  rate: 4.9,
  avatarUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
  about:
      'With over 10 years of experience in cognitive behavioral therapy, I help patients develop coping strategies for anxiety and depression.',
  availableDates: [
    AvailableDateEntity(
      date: DateTime(2025, 5, 2),
      availableTimes: [
        DateTime(2025, 5, 2, 9, 0),
        DateTime(2025, 5, 2, 10, 0),
        DateTime(2025, 5, 2, 11, 0),
        DateTime(2025, 5, 2, 13, 0),
        DateTime(2025, 5, 2, 14, 0),
        DateTime(2025, 5, 2, 15, 0),
        DateTime(2025, 5, 2, 16, 0),
      ],
    ),
  ],
);
