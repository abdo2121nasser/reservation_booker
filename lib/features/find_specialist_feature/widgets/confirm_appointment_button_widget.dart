import 'package:flutter/cupertino.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/component/general_button_widget.dart';
import '../../../core/utils/strings/strings.dart';
import '../../../core/utils/values/app_size.dart';
import '../screens/specialist_detail_screen.dart';
import 'package:provider/provider.dart';

class ConfirmAppointmentButtonWidget extends StatelessWidget {
  const ConfirmAppointmentButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DateChangerNotifier>(context);
    return GeneralButtonWidget(
        label: kConfirmAppointment,
        function: () {},
        textColor: kWhiteColor,
        backgroundColor:
            provider.isTimeSelected ? kOrangeColor : kLightOrangeColor,
        borderRadius: k10R);
  }
}
