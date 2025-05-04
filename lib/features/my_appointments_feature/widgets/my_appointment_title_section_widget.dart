import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_booker/core/utils/colors/colors.dart';
import 'package:reservation_booker/core/utils/values/app_size.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/appointment_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/custom_cashed_avatar_widget.dart';
import 'package:reservation_booker/features/my_appointments_feature/cubits/cancel_my_appointments_cubit/cancel_my_appointments_cubit.dart';
import 'package:reservation_booker/features/my_appointments_feature/cubits/get_my_appointments_cubit/get_my_appointments_cubit.dart';
import 'package:reservation_booker/features/my_appointments_feature/cubits/get_my_appointments_cubit/get_my_appointments_cubit.dart';
import 'package:reservation_booker/features/my_appointments_feature/repositories/get_appointment_repository.dart';
import '../../find_specialist_feature/widgets/specialist_information_widget.dart';
import 'cancel_appointment_button_widget.dart';

class MyAppointmentTitleSectionWidget extends StatelessWidget {
  final BoxConstraints constrains;
  final AppointmentEntity myAppointment;

  const MyAppointmentTitleSectionWidget({super.key, required this.constrains,
    required this.myAppointment
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomCashedAvatarWidget(
            imageLink: myAppointment.specialistData.avatarUrl,
            constrains: constrains * 0.8),
        SizedBox(
          width: k10H,
        ),
        SpecialistInformationWidget(
            constraints: constrains,
            dataEntity: myAppointment.specialistData
        ),
        SizedBox(
          width: k10H,
        ),
        CancelAppointmentButtonWidget(myAppointment: myAppointment,)
      ],
    );
  }
}

