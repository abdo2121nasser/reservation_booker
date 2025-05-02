import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';

class SpecialistModel extends SpecialistEntity {
  SpecialistModel({
    required super.name,
    required super.category,
    required super.rate,
    required super.avatarUrl,
    required super.about,
    required super.availableDates,
  });
  factory SpecialistModel.fromJson(Map<String, dynamic> json) {
    return SpecialistModel(
      name: json['name'],
      category: json['category'],
      rate: json['rate'],
      avatarUrl: json['avatarUrl'],
      about: json['about'],
      availableDates: (json['availableDates'] as List)
          .map((e) => AvailableDateModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'rate': rate,
      'avatarUrl': avatarUrl,
      'about': about,
      'availableDates': availableDates
          .map((e) => (e as AvailableDateModel).toJson())
          .toList(),
    };
  }
}

class AvailableDateModel extends AvailableDateEntity {
  AvailableDateModel({required super.date, required super.availableTimes});
  factory AvailableDateModel.fromJson(Map<String, dynamic> json) {
    return AvailableDateModel(
      date: (json['date'] as Timestamp).toDate(),
      availableTimes: (json['availableTimes'] as List)
          .map(
              (e) => (e as Timestamp).toDate()) // Convert Timestamp to DateTime
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': Timestamp.fromDate(date),
      'availableTimes':
          availableTimes.map((e) => Timestamp.fromDate(e)).toList(),
    };
  }
}
