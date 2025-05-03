import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import '../../../core/utils/values/font_size.dart';
import '../entities/specialist_entity.dart';

class TimeItemWidget extends StatelessWidget {
  final AvailableTimeEntity timeEntity;
  const TimeItemWidget({super.key, required this.timeEntity
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: k10H, vertical: k5V),
      decoration: BoxDecoration(
          color: timeEntity.isSelected ? kBlueColor : kWhiteColor,
          borderRadius: BorderRadius.circular(k20R),
          border:
          timeEntity.isSelected ? null : Border.all(color: kBlackColor, width: k1H)),
      child: Text(
        DateFormat.jm().format(timeEntity.time),
        style: TextStyle(
            fontSize: k16Sp,
            color: timeEntity.isSelected ? kWhiteColor : kBlackColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
