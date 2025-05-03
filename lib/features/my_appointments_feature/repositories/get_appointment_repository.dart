import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/appointment_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/models/appointment_model.dart';

import '../../../core/services/failure_service.dart';
import '../../../core/utils/component/toast_message_function.dart';

abstract class GetAppointmentRepository {
  Future<List<AppointmentEntity>> getAppointments();
}

class GetAllAppointmentsFromFireBase implements GetAppointmentRepository {
  @override
  Future<List<AppointmentEntity>> getAppointments() async {
    try {
     return await FirebaseFirestore.instance
          .collection(kMyAppointmentCollection)
          .get()
          .then((value) {
        List<AppointmentModel> appointments = [];
        value.docs.forEach((element) {
          appointments.add(AppointmentModel.fromJson(
              docId: element.id, json: element.data()));
        });
        return appointments;
      });
    } on FirebaseException catch (e) {
      final failure = FirebaseFailure.fromFirebase(e);
      debugPrint(failure.devMessage);
      showToastMessage(
        message: failure.userMessage,
      );
      return [];
    } catch (error) {
      debugPrint(error.toString());
      showToastMessage(message: kUnknownErrorMessage);
      return [];
    }
  }
}

class GetAllAppointmentsFromHive implements GetAppointmentRepository {
  @override
  Future<List<AppointmentEntity>> getAppointments() async {
    try {
      var box = Hive.box(kMyAppointmentsBox);
      List<AppointmentEntity> myAppointments =
      box.get(kSpecialists, defaultValue: []).cast<AppointmentEntity>();
     return myAppointments;
    } catch (error) {
      debugPrint(error.toString());
      showToastMessage(message: kUnknownErrorMessage);
      return [];
    }
  }
}
