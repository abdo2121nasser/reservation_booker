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
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 9, 0),isSelected: false),


      ],
    ),  AvailableDateEntity(
      date: DateTime(2025, 6, 4),
      availableTimes: [
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 9, 0),isSelected: true),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 1, 0),isSelected: false),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 4, 0),isSelected: false),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 5, 0),isSelected: false),

      ],
    ),AvailableDateEntity(
      date: DateTime(2025, 6, 4),
      availableTimes: [
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 9, 0),isSelected: true),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 1, 0),isSelected: false),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 4, 0),isSelected: false),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 5, 0),isSelected: false),

      ],
    ),AvailableDateEntity(
      date: DateTime(2025, 6, 4),
      availableTimes: [
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 9, 0),isSelected: true),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 1, 0),isSelected: false),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 4, 0),isSelected: false),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 5, 0),isSelected: false),

      ],
    ),AvailableDateEntity(
      date: DateTime(2025, 6, 4),
      availableTimes: [
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 9, 0),isSelected: true),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 1, 0),isSelected: false),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 4, 0),isSelected: false),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 5, 0),isSelected: false),

      ],
    ),AvailableDateEntity(
      date: DateTime(2025, 6, 4),
      availableTimes: [
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 9, 0),isSelected: true),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 1, 0),isSelected: false),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 4, 0),isSelected: false),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 5, 0),isSelected: false),

      ],
    ),AvailableDateEntity(
      date: DateTime(2025, 6, 4),
      availableTimes: [
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 9, 0),isSelected: true),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 1, 0),isSelected: false),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 4, 0),isSelected: false),
       AvailableTimeEntity(time: DateTime(2025, 5, 2, 5, 0),isSelected: false),

      ],
    ),
  ],
);
