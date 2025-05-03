import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/services/failure_service.dart';
import '../../../core/utils/component/toast_message_function.dart';
import '../../../core/utils/strings/strings.dart';
import '../../find_specialist_feature/entities/appointment_entity.dart';
import '../../find_specialist_feature/models/appointment_model.dart';
import '../../find_specialist_feature/models/specialist_model.dart';

abstract class CancelAppointmentRepository {
  Future<void> cancelAppointment();
  Future<void> cancelAppointmentReservation();
}

class CancelAppointmentFromFireBase implements CancelAppointmentRepository {
  final AppointmentModel appointmentModel;

  CancelAppointmentFromFireBase({required this.appointmentModel});
  @override
  Future<void> cancelAppointment() async {
    try {
      await FirebaseFirestore.instance
          .collection(kMyAppointmentCollection)
          .doc(appointmentModel.docId)
          .delete();
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
  Future<void> cancelAppointmentReservation() async {
    final docRef = FirebaseFirestore.instance
        .collection(kSpecialistCollection) // your collection
        .doc(appointmentModel.specialistData.specialistDocId);
    try {
      final snapshot = await docRef.get();
      SpecialistModel specialistModel =
          SpecialistModel.fromJson(json: snapshot.data()!, docId: snapshot.id);
      int dateIndex = specialistModel.availableDates.indexWhere(
          (date) => date.date.isAtSameMomentAs(appointmentModel.selectedDate));
      specialistModel.availableDates[dateIndex].availableTimes
          .firstWhere((time) =>
              time.time.isAtSameMomentAs(appointmentModel.selectedTime))
          .isBooked = false;

      await docRef.update(specialistModel.toJson());
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
