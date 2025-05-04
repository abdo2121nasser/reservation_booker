import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_booker/configuration/routes.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/appointment_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/extra_data_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/repositries/book_appointment.dart';
import 'package:reservation_booker/features/find_specialist_feature/repositries/get_specialists.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/component/general_button_widget.dart';
import '../../../core/utils/strings/strings.dart';
import '../../../core/utils/values/app_size.dart';

import '../../main_feature/cubits/main_cubit/main_cubit.dart';
import '../cubits/book_appointment_cubit/book_appointment_cubit.dart' as book;
import '../cubits/find_specialist_cubit/find_specialist_cubit.dart' as find;
import '../screens/specialist_detail_screen.dart';
import 'package:provider/provider.dart';

class RescheduleAppointmentButtonWidget extends StatelessWidget {
  const RescheduleAppointmentButtonWidget(
      {super.key, required this.extraDataEntity});

  final ExtraDataEntity extraDataEntity;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DateChangerNotifier>(context);

    return BlocBuilder<find.FindSpecialistCubit, find.FindSpecialistState>(
      builder: (context, findSpecialistState) {
        return BlocBuilder<book.BookAppointmentCubit,
            book.BookAppointmentState>(
          builder: (context, bookAppointmentState) {
            if (bookAppointmentState is LoadingState ||
                findSpecialistState is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GeneralButtonWidget(
                  label: kConfirmAppointment,
                  function: () async {
                    if (provider.isTimeSelected) {
                      await book.BookAppointmentCubit.get(context)
                          .bookAppointment(
                        bookAppointmentRepository: BookAppointmentFromFireBase(
                            appointmentEntity: AppointmentEntity(
                                specialistData: extraDataEntity.specialistEntity.data,
                                selectedDate: provider.selectedDate.date,
                                selectedTime: provider.selectedTime)),
                      );
                      await find.FindSpecialistCubit.get(context)
                          .getSpecialists(
                          specialistsRepository:
                          GetAllSpecialistsFromFireBase());
                      AppRoute.router.pop();
                    }
                  },
                  textColor: kWhiteColor,
                  backgroundColor: provider.isTimeSelected
                      ? kOrangeColor
                      : kLightOrangeColor,
                  borderRadius: k10R);
            }
          },
        );
      },
    );
  }
}
