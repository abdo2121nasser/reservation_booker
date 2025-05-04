import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_booker/core/utils/colors/colors.dart';
import 'package:reservation_booker/core/utils/component/general_button_widget.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/core/utils/values/app_size.dart';
import 'package:reservation_booker/features/find_specialist_feature/cubits/book_appointment_cubit/book_appointment_cubit.dart';
import 'package:reservation_booker/features/find_specialist_feature/cubits/find_specialist_cubit/find_specialist_cubit.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/extra_data_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_about_section_widget.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_profile_section_widget.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/time_section_widget.dart';
import 'package:reservation_booker/features/main_feature/cubits/main_cubit/main_cubit.dart';
import '../entities/specialist_entity.dart';
import '../screens/specialist_detail_screen.dart';
import 'confirm_appointment_button_widget.dart';
import 'date_section_widget.dart';
import 'package:provider/provider.dart';

class SpecialistDetailScreenBodyWidget extends StatelessWidget {
  final ExtraDataEntity extraDataEntity;

  const SpecialistDetailScreenBodyWidget(
      {super.key,
      required this.extraDataEntity});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SpecialistProfileSectionWidget(dataEntity: extraDataEntity.specialistEntity.data),
          SpecialistAboutSectionWidget(content: extraDataEntity.specialistEntity.data.about),
          DateSectionWidget(availableDates: extraDataEntity.specialistEntity.availableDates),
          isDateSelected(context)
              ? TimeSectionWidget(availableTimes: getSelectedDate(context))
              : const SizedBox.shrink(),
          isDateSelected(context)
              ? ConfirmAppointmentButtonWidget(
                extraDataEntity: extraDataEntity,
              )
              : const SizedBox.shrink(),
          SizedBox(
            height: k10V,
          )
        ],
      ),
    );
  }

  bool isDateSelected(BuildContext context) =>
      Provider.of<DateChangerNotifier>(context).isDateSelected;
  List<AvailableTimeEntity> getSelectedDate(BuildContext context) =>
      Provider.of<DateChangerNotifier>(context).selectedDate.availableTimes;
}
