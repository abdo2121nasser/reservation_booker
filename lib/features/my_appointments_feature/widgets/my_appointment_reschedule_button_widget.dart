import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/colors/colors.dart';
import 'package:reservation_booker/core/utils/component/general_button_widget.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/core/utils/values/app_size.dart';

class MyAppointmentRescheduleButtonWidget extends StatelessWidget {
  const MyAppointmentRescheduleButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GeneralButtonWidget(
        label: kRescheduleWord,
        function: (){},
        textColor: kBlueColor,
        backgroundColor: kLightBlueColor,
        borderRadius: k10R);
  }
}
