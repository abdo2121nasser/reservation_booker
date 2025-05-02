import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/colors/colors.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/core/utils/values/app_size.dart';
import 'package:reservation_booker/core/utils/values/font_size.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_about_section_widget.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_profile_section_widget.dart';

import '../entities/specialist_entity.dart';
import 'date_items_list_view_widget.dart';

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
          const SpecialistAboutSectionWidget(
            content:
                'With over 10 years of experience in cognitive behavioral therapy, I help patients develop coping strategies for anxiety and depression.',
          ),
          DateItemsListViewWidget(availableDateEntity: specialistEntity.availableDates,)
        ],
      ),
    );
  }
}


