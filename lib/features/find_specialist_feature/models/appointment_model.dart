import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';

import '../entities/appointment_entity.dart';

class AppointmentModel extends AppointmentEntity {
  final String docId;
  AppointmentModel({
    required super.specialistData,
    required super.selectedDate,
    required super.selectedTime,
    this.docId=''
  });

  factory AppointmentModel.fromJson({required Map<String, dynamic> json,required String docId}) {
    return AppointmentModel(
      docId: docId,
      specialistData: DataEntity(
        specialistDocId: json['specialistData']['specialistDocId'],
        name: json['specialistData']['name'],
        category: json['specialistData']['category'],
        rate: json['specialistData']['rate'],
        avatarUrl: json['specialistData']['avatarUrl'],
        about: json['specialistData']['about'],
      ),
      selectedDate: (json['selectedDate'] as Timestamp).toDate(),
      selectedTime: (json['selectedTime'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'specialistData': {
        'specialistDocId':specialistData.specialistDocId,
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
