import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';

class SpecialistModel extends SpecialistEntity {
  SpecialistModel({
    required super.data,
    required super.availableDates,
  });

  factory SpecialistModel.fromJson({required Map<String, dynamic> json,required String docId}) {
    return SpecialistModel(
      data: DataEntity(
        specialistDocId: docId,
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
      'availableDates': availableDates.map((e) {
        return AvailableDateModel(
                date: e.date, availableTimes: e.availableTimes)
            .toJson();
      }) // This ensures you're calling toJson on AvailableDateModel
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
      availableTimes: (json['availableTimes'] as List)
          .map((e) => AvailableTimeModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': Timestamp.fromDate(date),
      'availableTimes': availableTimes.map((e) {
        return AvailableTimeModel(time: e.time,isBooked:e.isBooked).toJson();
      }).toList(),
    };
  }
}

class AvailableTimeModel extends AvailableTimeEntity {
  AvailableTimeModel({
    required super.time,
    required super.isBooked,
    super.isSelected,
  });

  factory AvailableTimeModel.fromJson(Map<String, dynamic> json) {
    return AvailableTimeModel(
        time: (json['time'] as Timestamp).toDate(), isBooked: json['isBooked']);
  }

  Map<String, dynamic> toJson() {
    return {'time': Timestamp.fromDate(time), 'isBooked': isBooked};
  }
}
