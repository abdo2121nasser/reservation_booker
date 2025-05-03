import 'package:hive/hive.dart';

part 'specialist_entity.g.dart'; // Don't forget to run build_runner

@HiveType(typeId: 0)
class SpecialistEntity {
  @HiveField(0)
  final DataEntity data;

  @HiveField(1)
   List<AvailableDateEntity> availableDates;
  @HiveField(2)
  final String docId;

  SpecialistEntity({
    required this.data,
    required this.availableDates,
    required this.docId
  });
}

@HiveType(typeId: 1)
class DataEntity {
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

  DataEntity({
    required this.name,
    required this.category,
    required this.rate,
    required this.avatarUrl,
    required this.about,
  });
}

@HiveType(typeId: 2)
class AvailableDateEntity {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  List<AvailableTimeEntity> availableTimes;

  bool isSelected;

  AvailableDateEntity({
    required this.date,
    required this.availableTimes,
    this.isSelected = false,
  });
}

@HiveType(typeId: 3)
class AvailableTimeEntity {
  @HiveField(0)
  final DateTime time;

  bool isSelected;
  @HiveField(1)
  bool isBooked;

  AvailableTimeEntity({
    required this.time,
    required this.isBooked,
    this.isSelected = false,
  });
}
