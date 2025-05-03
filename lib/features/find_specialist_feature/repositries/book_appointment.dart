import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:reservation_booker/core/services/failure_service.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/features/find_specialist_feature/models/appointment_model.dart';

import '../../../core/utils/component/toast_message_function.dart';
import '../entities/appointment_entity.dart';

abstract class BookAppointmentRepository {
  final AppointmentEntity appointmentEntity;

  BookAppointmentRepository({required this.appointmentEntity});
  Future<void> book();
}

class BookAppointmentFromFireBase extends BookAppointmentRepository {
  BookAppointmentFromFireBase({required super.appointmentEntity});
  @override
  Future<void> book() async {
    try {
      AppointmentModel appointmentModel = AppointmentModel(
          specialistData: appointmentEntity.specialistData,
          selectedDate: appointmentEntity.selectedDate,
          selectedTime: appointmentEntity.selectedTime);
      FirebaseFirestore.instance
          .collection(kMyAppointmentCollection)
          .add(appointmentModel.toJson());
    } on FirebaseException catch (e) {
      final failure = FirebaseFailure.fromFirebase(e);
      debugPrint(failure.devMessage);
      showToastMessage(
        message: failure.userMessage,
      );
    } catch (error) {
      debugPrint(error.toString());
      showToastMessage(message: kUnknownErrorMessage);
    }
  }
}
