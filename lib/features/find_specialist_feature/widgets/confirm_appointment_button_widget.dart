import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/extra_data_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/reschedule_appointment_button_widget.dart';
import 'package:reservation_booker/features/my_appointments_feature/cubits/cancel_my_appointments_cubit/cancel_my_appointments_cubit.dart';

import '../cubits/book_appointment_cubit/book_appointment_cubit.dart';
import '../cubits/find_specialist_cubit/find_specialist_cubit.dart';
import 'book_appointment_button_widget.dart';

class ConfirmAppointmentButtonWidget extends StatelessWidget {
  final ExtraDataEntity extraDataEntity;

  const ConfirmAppointmentButtonWidget(
      {super.key, required this.extraDataEntity});

  @override
  Widget build(BuildContext context) {
    if (extraDataEntity.oldAppointment == null &&
        extraDataEntity.mainCubit != null) {
      //only book appointment
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BookAppointmentCubit()),
          BlocProvider.value(
              value: extraDataEntity.mainCubit! as FindSpecialistCubit)
        ],
        child: BookAppointmentButtonWidget(
            dataEntity: extraDataEntity.specialistEntity.data),
      );
    } else {
      // book then cancel then get all appointment form firebase and store in hive
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BookAppointmentCubit()),
          BlocProvider.value(value: extraDataEntity.mainCubit!
                  as CancelMyAppointmentsCubit), //to update the stored specialist list in hive from firebase
        ],
        child: RescheduleAppointmentButtonWidget(
          extraDataEntity: extraDataEntity,
        ),
      );
    }
  }
}
