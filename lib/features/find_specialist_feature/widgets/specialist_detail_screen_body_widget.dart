import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/colors/colors.dart';
import 'package:reservation_booker/core/utils/component/general_button_widget.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/core/utils/values/app_size.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_about_section_widget.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_profile_section_widget.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/time_section_widget.dart';
import '../entities/specialist_entity.dart';
import '../screens/specialist_detail_screen.dart';
import 'confirm_appointment_button_widget.dart';
import 'date_section_widget.dart';
import 'package:provider/provider.dart';

class SpecialistDetailScreenBodyWidget extends StatelessWidget {
  final SpecialistEntity specialistEntity;

  const SpecialistDetailScreenBodyWidget({
    super.key,
    required this.specialistEntity,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SpecialistProfileSectionWidget(specialistEntity: specialistEntity),
          SpecialistAboutSectionWidget(content: specialistEntity.about),
          DateSectionWidget(availableDates: specialistEntity.availableDates),
          isDateSelected(context)
              ? TimeSectionWidget(
                  availableTimes: getSelectedDate(context).availableTimes)
              : const SizedBox.shrink(),
          isDateSelected(context)?
          ConfirmAppointmentButtonWidget()
              : const SizedBox.shrink(),
          SizedBox(height: k10V,)


        ],
      ),
    );
  }

  bool isDateSelected(BuildContext context) =>
      Provider.of<DateChangerNotifier>(context).isDateSelected;
  AvailableDateEntity getSelectedDate(BuildContext context) =>
      Provider.of<DateChangerNotifier>(context).selectedDate;
}

