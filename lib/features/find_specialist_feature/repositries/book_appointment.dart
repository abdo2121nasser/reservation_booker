import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:reservation_booker/core/services/failure_service.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/features/find_specialist_feature/models/appointment_model.dart';
import 'package:reservation_booker/features/find_specialist_feature/models/specialist_model.dart';

import '../../../core/utils/component/toast_message_function.dart';
import '../entities/appointment_entity.dart';

abstract class BookAppointmentRepository {
  Future<void> book();
  Future<void> reserveAppointment();
}

class BookAppointmentFromFireBase implements BookAppointmentRepository {
  final AppointmentEntity appointmentEntity;
  final String specialistDocId;

  BookAppointmentFromFireBase(
      {required this.appointmentEntity, required this.specialistDocId});
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

  @override
  Future<void> reserveAppointment() async {
    final docRef = FirebaseFirestore.instance
        .collection(kSpecialistCollection) // your collection
        .doc(specialistDocId);
    try {
      await FirebaseFirestore.instance.runTransaction((value) async {
        final snapshot = await value.get(docRef);

        SpecialistModel specialistModel = SpecialistModel.fromJson(
            json: snapshot.data()!, docId: specialistDocId);

        int dateIndex = specialistModel.availableDates.indexWhere((date) =>
            date.date.isAtSameMomentAs(appointmentEntity.selectedDate));

        specialistModel.availableDates[dateIndex].availableTimes
            .firstWhere((time) =>
                time.time.isAtSameMomentAs(appointmentEntity.selectedTime))
            .isBooked = true;

        value.update(docRef, specialistModel.toJson());
      });
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
