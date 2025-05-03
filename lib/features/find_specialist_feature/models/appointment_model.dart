import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';

import '../entities/appointment_entity.dart';

class AppointmentModel extends AppointmentEntity {
  AppointmentModel({
    required super.specialistData,
    required super.selectedDate,
    required super.selectedTime,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      specialistData: DataEntity(
        name: json['name'],
        category: json['category'],
        rate: json['rate'],
        avatarUrl: json['avatarUrl'],
        about: json['about'],
      ),
      selectedDate: (json['selectedDate'] as Timestamp).toDate(),
      selectedTime: (json['selectedTime'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'specialistData': {
        'name': specialistData.name,
        'category': specialistData.category,
        'rate': specialistData.rate,
        'avatarUrl': specialistData.avatarUrl,
        'about': specialistData.about,
      },
      'selectedDate': Timestamp.fromDate(selectedDate),
      'selectedTime': Timestamp.fromDate(selectedTime),
    };
  }
}
