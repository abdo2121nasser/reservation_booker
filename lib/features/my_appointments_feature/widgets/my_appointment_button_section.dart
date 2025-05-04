import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_booker/features/my_appointments_feature/widgets/due_widget.dart';
import 'my_appointment_reschedule_button_widget.dart';

class MyAppointmentButtonSection extends StatelessWidget {
  const MyAppointmentButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyAppointmentRescheduleButtonWidget(),

        DueWidget(date: DateTime.now(),)
      ],
    );
  }
}
