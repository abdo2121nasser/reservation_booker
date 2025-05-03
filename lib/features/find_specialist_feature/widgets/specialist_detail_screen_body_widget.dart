import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/colors/colors.dart';
import 'package:reservation_booker/core/utils/component/custom_title_widget.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/core/utils/values/app_size.dart';
import 'package:reservation_booker/core/utils/values/font_size.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_about_section_widget.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_profile_section_widget.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/time_section_widget.dart';

import '../entities/specialist_entity.dart';
import 'date_items_list_view_widget.dart';
import 'date_section_widget.dart';

class SpecialistDetailScreenBodyWidget extends StatelessWidget {
  final SpecialistEntity specialistEntity;
  SpecialistDetailScreenBodyWidget({
    super.key,
    required this.specialistEntity,
  });

  AvailableDateEntity? selectedDate;
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          SpecialistProfileSectionWidget(specialistEntity: specialistEntity),
          SpecialistAboutSectionWidget(content: specialistEntity.about),
          DateSectionWidget(availableDates: specialistEntity.availableDates),
          !isDateSelected?
          TimeSectionWidget(
              availableTimes:
                  specialistEntity.availableDates.first.availableTimes
          ):SizedBox.shrink()
        ],
      ),
    );
  }

  bool get isDateSelected => selectedDate!=null;
}
