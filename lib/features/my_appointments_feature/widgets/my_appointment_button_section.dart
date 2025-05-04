import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/appointment_entity.dart';
import 'package:reservation_booker/features/my_appointments_feature/widgets/due_widget.dart';
import 'my_appointment_reschedule_button_widget.dart';

class MyAppointmentButtonSection extends StatelessWidget {
  final AppointmentEntity myAppointment;
  const MyAppointmentButtonSection({
    super.key,
    required this.myAppointment
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyAppointmentRescheduleButtonWidget(oldAppointment: myAppointment,),

        DueWidget(date: myAppointment.selectedTime,)
      ],
    );
  }
}
