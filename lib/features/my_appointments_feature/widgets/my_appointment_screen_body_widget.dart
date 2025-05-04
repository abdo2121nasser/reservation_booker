import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_booker/features/my_appointments_feature/cubits/get_my_appointments_cubit/get_my_appointments_cubit.dart';

import '../../main_feature/cubits/main_cubit/main_cubit.dart';
import 'my_appointment_container_list_view_widget.dart';

class MyAppointmentScreenBodyWidget extends StatelessWidget {
  const MyAppointmentScreenBodyWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        BlocBuilder<GetMyAppointmentsCubit, GetMyAppointmentsState>(
          builder: (context, state) {
            return MyAppointmentContainerListViewWidget(
              myAppointments: (state as SuccessState).data,
            );
          },
        ),
      ],
    );
  }
}
