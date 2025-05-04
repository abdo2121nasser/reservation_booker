import 'package:flutter/cupertino.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import 'my_appointment_button_section.dart';
import 'my_appointment_date_section_widget.dart';
import 'my_appointment_title_section_widget.dart';

class MyAppointmentContainerWidget extends StatelessWidget {
  const MyAppointmentContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: k10H, vertical: k10V),
      height: k120V,
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(k10R)),
      child: LayoutBuilder(builder: (context, constrain) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyAppointmentTitleSectionWidget(
              constrains: constrain,
            ),
            MyAppointmentDateSectionWidget(),
            MyAppointmentButtonSection()
          ],
        );
      }),
    );
  }
}
