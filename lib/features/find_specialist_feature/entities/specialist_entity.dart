import 'package:hive/hive.dart';

part 'specialist_entity.g.dart'; // Generated file

@HiveType(typeId: 0)
class SpecialistEntity {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String category;

  @HiveField(2)
  final num rate;

  @HiveField(3)
  final String avatarUrl;

  @HiveField(4)
  final String about;

  @HiveField(5)
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

@HiveType(typeId: 1)
class AvailableDateEntity {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final List<AvailableTimeEntity> availableTimes;
  @HiveField(2)
  bool isSelected;

  AvailableDateEntity({
    required this.date,
    required this.availableTimes,
    this.isSelected=false
  });
}
@HiveType(typeId: 2)
class AvailableTimeEntity{
  @HiveField(0)
  final DateTime time;
  @HiveField(1)
   bool isSelected;

  AvailableTimeEntity({required this.time, required this.isSelected});

}
