import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/time_items_list_view_widget.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import '../../../core/utils/values/font_size.dart';
import '../entities/specialist_entity.dart';

class TimeSectionWidget extends StatelessWidget {
  const TimeSectionWidget({
    super.key,
    required this.availableTimes,
  });

  final List<AvailableTimeEntity> availableTimes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: k16V, horizontal: k14H),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            kTimeSection,
            style: TextStyle(
                fontSize: k20Sp,
                color: kBlackColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: k10V,
          ),
          TimeItemsListViewWidget(availableTimes: availableTimes,)
        ],
      ),
    );
  }
}


