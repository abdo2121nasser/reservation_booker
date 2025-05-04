import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/colors/colors.dart';
import 'package:reservation_booker/core/utils/values/app_size.dart';
import 'package:reservation_booker/core/utils/values/font_size.dart';
import 'package:intl/intl.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/appointment_entity.dart';

class MyAppointmentDateSectionWidget extends StatelessWidget {
  final AppointmentEntity myAppointment;
  const MyAppointmentDateSectionWidget({
    super.key,
    required this.myAppointment
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: k10V),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_today,
                color: kBlueColor,
              ),
              SizedBox(
                width: k10H,
              ),
              Text(
                DateFormat('EEEE, MMMM dd, yyyy').format(myAppointment.selectedDate),
                style: TextStyle(
                  fontSize: k16Sp,
                ),
              )
            ],
          ),
          SizedBox(
            height: k5V,
          ),
          Row(
            children: [
              const Icon(
                Icons.watch_later_outlined,
                color: kBlueColor,
              ),
              SizedBox(
                width: k10H,
              ),
              Text(
                DateFormat('h:mm a').format(myAppointment.selectedTime),
                style: TextStyle(
                  fontSize: k16Sp,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
