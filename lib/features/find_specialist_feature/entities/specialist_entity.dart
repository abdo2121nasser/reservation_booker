import 'package:cloud_firestore/cloud_firestore.dart';

class SpecialistEntity {
  final String name;
  final String category;
  final num rate;
  final String avatarUrl;
  final String about;
  final List<AvailableDateEntity> availableDates;

  SpecialistEntity({
    required this.name,
    required this.category,
    required this.rate,
    required this.avatarUrl,
    required this.about,
    required this.availableDates,
  });

}

class AvailableDateEntity {
  final DateTime date;
  final List<DateTime> availableTimes;

  AvailableDateEntity({
    required this.date,
    required this.availableTimes,
  });

}
