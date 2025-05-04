import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/appointment_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/models/appointment_model.dart';
import 'package:reservation_booker/features/my_appointments_feature/cubits/cancel_my_appointments_cubit/cancel_my_appointments_cubit.dart';
import 'package:reservation_booker/features/my_appointments_feature/repositories/cancel_appointment_repository.dart';

import '../../../core/utils/colors/colors.dart';

class CancelAppointmentButtonWidget extends StatelessWidget {
  final AppointmentEntity myAppointment;
  const CancelAppointmentButtonWidget({super.key, required this.myAppointment});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          CancelMyAppointmentsCubit.get(context).cancelAppointment(
              cancelAppointmentRepository: CancelAppointmentFromFireBase(
                  appointmentModel: AppointmentModel(
                    docId: myAppointment.docId,
                      specialistData: myAppointment.specialistData,
                      selectedDate: myAppointment.selectedDate,
                      selectedTime: myAppointment.selectedTime)));
        },
        icon: const Icon(
          CupertinoIcons.clear,
          color: kRedColor,
        ));
  }
}
