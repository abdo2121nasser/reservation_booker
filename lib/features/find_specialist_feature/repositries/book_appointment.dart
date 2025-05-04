import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:reservation_booker/core/services/failure_service.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/features/find_specialist_feature/models/appointment_model.dart';
import 'package:reservation_booker/features/find_specialist_feature/models/specialist_model.dart';

import '../../../core/utils/component/toast_message_function.dart';
import '../entities/appointment_entity.dart';

abstract class BookAppointmentRepository {
  Future<void> bookAppointment();
  Future<void> reserveAppointment();
}

class BookAppointmentFromFireBase implements BookAppointmentRepository {
  final AppointmentEntity appointmentEntity;

  BookAppointmentFromFireBase({required this.appointmentEntity});
  @override
  Future<void> bookAppointment() async {
    AppointmentModel appointmentModel = AppointmentModel(
        specialistData: appointmentEntity.specialistData,
        selectedDate: appointmentEntity.selectedDate,
        selectedTime: appointmentEntity.selectedTime);
    final String userDocId = FirebaseAuth.instance.currentUser!.uid;

    try {
      FirebaseFirestore.instance
          .collection(kUserCollection)
          .doc(userDocId)
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
        .doc(appointmentEntity.specialistData.specialistDocId);
    try {
      await FirebaseFirestore.instance.runTransaction((value) async {
        final snapshot = await value.get(docRef);

        SpecialistModel specialistModel = SpecialistModel.fromJson(
            json: snapshot.data()!,
            docId: appointmentEntity.specialistData.specialistDocId);

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
