import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import '../../../core/utils/values/font_size.dart';
import '../entities/specialist_entity.dart';
import 'date_items_list_view_widget.dart';

class DateSectionWidget extends StatelessWidget {
  const DateSectionWidget({
    super.key,
    required this.availableDates,
  });

  final List<AvailableDateEntity> availableDates;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: k16V, horizontal: k14H),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(kDateSection,
            style:  TextStyle(
                fontSize: k20Sp,
                color: kBlackColor,
                fontWeight: FontWeight.bold),),
          SizedBox(height: k10V,),
          DateItemsListViewWidget(availableDateEntity: availableDates,),


        ],
      ),
    );
  }
}
