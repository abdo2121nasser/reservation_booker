import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';

class CancelAppointmentButtonWidget extends StatelessWidget {
  const CancelAppointmentButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          CupertinoIcons.clear,
          color: kRedColor,
        ));
  }
}
