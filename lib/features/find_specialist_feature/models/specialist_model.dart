import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';

class SpecialistModel extends SpecialistEntity {
  SpecialistModel({
    required super.data,
    required super.availableDates,
  });

  factory SpecialistModel.fromJson(Map<String, dynamic> json) {
    return SpecialistModel(
      data: DataEntity(
        name: json['name'],
        category: json[kCategory],
        rate: json['rate'],
        avatarUrl: json['avatarUrl'],
        about: json['about'],
      ),
      availableDates: (json['availableDates'] as List)
          .map((e) => AvailableDateModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': data.name,
      'category': data.category,
      'rate': data.rate,
      'avatarUrl': data.avatarUrl,
      'about': data.about,
      'availableDates': availableDates
          .map((e) => (e as AvailableDateModel).toJson())
          .toList(),
    };
  }
}

class AvailableDateModel extends AvailableDateEntity {
  AvailableDateModel({
    required super.date,
    required super.availableTimes,
    super.isSelected = false,
  });

  factory AvailableDateModel.fromJson(Map<String, dynamic> json) {
    return AvailableDateModel(
      date: (json['date'] as Timestamp).toDate(),
      isSelected: json['isSelected'] ?? false,
      availableTimes: (json['availableTimes'] as List)
          .map((e) => AvailableTimeModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': Timestamp.fromDate(date),
      'isSelected': isSelected,
      'availableTimes': availableTimes
          .map((e) => (e as AvailableTimeModel).toJson())
          .toList(),
    };
  }
}

class AvailableTimeModel extends AvailableTimeEntity {
  AvailableTimeModel({
    required super.time,
    required super.isSelected,
  });

  factory AvailableTimeModel.fromJson(Map<String, dynamic> json) {
    return AvailableTimeModel(
      time: (json['time'] as Timestamp).toDate(),
      isSelected: json['isSelected'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': Timestamp.fromDate(time),
      'isSelected': isSelected,
    };
  }
}
