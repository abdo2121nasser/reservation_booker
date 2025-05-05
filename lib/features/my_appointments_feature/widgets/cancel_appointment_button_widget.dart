import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
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
          if (_canCancelAppointment(myAppointment.selectedTime)) {
            CancelMyAppointmentsCubit.get(context).cancelAppointment(
                cancelAppointmentRepository: CancelAppointmentFromFireBase(
                    appointmentModel: AppointmentModel(
                        docId: myAppointment.docId,
                        specialistData: myAppointment.specialistData,
                        selectedDate: myAppointment.selectedDate,
                        selectedTime: myAppointment.selectedTime)));
          }
          else{
            _showCancelWarningDialog(context, );
          }
        },
        icon: const Icon(
          CupertinoIcons.clear,
          color: kRedColor,
        ));
  }

  void _showCancelWarningDialog(
      BuildContext context) {


    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: kBackgroundColor,
        title: const Text(kCancelWarningTitle),
        content: Text(
          kCancelWarningBody,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK",
            style: TextStyle(color: kBlueColor),
            ),
          ),
        ],
      ),
    );
  }

  bool _canCancelAppointment(DateTime selectedTime) =>

      selectedTime.difference(DateTime.now()).inHours >= 1;
}
