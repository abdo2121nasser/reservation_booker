import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/appointment_entity.dart';

import '../../../core/utils/component/toast_message_function.dart';
import '../../../core/utils/strings/strings.dart';

abstract class StoreMyAppointmentsRepository{
  void storeMyAppointments({required List<AppointmentEntity> appointments});

}

class StoreMyAppointmentsUsingHive implements StoreMyAppointmentsRepository{
  @override
  Future<void> storeMyAppointments({required List<AppointmentEntity> appointments}) async {
    try {
      var box =  Hive.box(kMyAppointmentsBox);
      box.clear();
      await box.put(kMyAppointments, appointments);

    } catch (error) {
      debugPrint(error.toString());
      showToastMessage(message: kUnknownErrorMessage);
    }
  }




}