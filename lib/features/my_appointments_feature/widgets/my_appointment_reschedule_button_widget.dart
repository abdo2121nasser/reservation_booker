import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_booker/configuration/routes.dart';
import 'package:reservation_booker/core/utils/colors/colors.dart';
import 'package:reservation_booker/core/utils/component/general_button_widget.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/core/utils/values/app_size.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/extra_data_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';
import 'package:reservation_booker/features/my_appointments_feature/cubits/cancel_my_appointments_cubit/cancel_my_appointments_cubit.dart';

import '../../find_specialist_feature/entities/appointment_entity.dart';
import '../../find_specialist_feature/repositries/get_specialists.dart';

class MyAppointmentRescheduleButtonWidget extends StatelessWidget {
  final AppointmentEntity oldAppointment;

  const MyAppointmentRescheduleButtonWidget(
      {super.key, required this.oldAppointment});

  @override
  Widget build(BuildContext context) {
    return GeneralButtonWidget(
        label: kRescheduleWord,
        function: () async {
          List<SpecialistEntity> specialist =
              await GetFilteredSpecialistsByDocIdFromFireBase(
                      specialistDocId:
                          oldAppointment.specialistData.specialistDocId)
                  .getSpecialist();
          AppRoute.router.push(AppRoute.specialistDetailScreen,
              extra: ExtraDataEntity(
                specialistEntity: specialist.first,
                oldAppointment: oldAppointment,
                mainCubit: CancelMyAppointmentsCubit.get(context)
              ));
        },
        textColor: kBlueColor,
        backgroundColor: kLightBlueColor,
        borderRadius: k10R);
  }
}
