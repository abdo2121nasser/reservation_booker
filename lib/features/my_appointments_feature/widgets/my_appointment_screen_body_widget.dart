import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/my_appointment_container_widget.dart';

class MyAppointmentScreenBodyWidget extends StatelessWidget {
  const MyAppointmentScreenBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [




        MyAppointmentContainerWidget()],
    );
  }
}
