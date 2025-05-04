import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/values/app_size.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/appointment_entity.dart';
import 'package:reservation_booker/features/my_appointments_feature/cubits/get_my_appointments_cubit/get_my_appointments_cubit.dart';
import 'package:reservation_booker/features/my_appointments_feature/repositories/get_appointment_repository.dart';

import '../widgets/my_appointment_container_widget.dart';

class MyAppointmentContainerListViewWidget extends StatelessWidget {
  final List<AppointmentEntity> myAppointments;
  const MyAppointmentContainerListViewWidget({
    super.key,
   required this.myAppointments
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          GetMyAppointmentsCubit.get(context).
          getAppointments(getAppointmentRepository: GetAllAppointmentsFromFireBase());
        },
        child: ListView.separated(
            itemBuilder: (context, index) => MyAppointmentContainerWidget(
              myAppointment: myAppointments[index],
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: k10V,
            ),
            itemCount: myAppointments.length),
      ),
    );
  }
}
