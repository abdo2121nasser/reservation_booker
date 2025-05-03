import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import '../../../core/utils/values/font_size.dart';

class TimeItemWidget extends StatelessWidget {
  final bool isSelected;

  const TimeItemWidget({
    super.key,

    required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: k10H, vertical: k5V),
      decoration: BoxDecoration(
          color: isSelected?kBlueColor:kWhiteColor,
          borderRadius: BorderRadius.circular(k20R),
          border: isSelected?null:Border.all(color: kBlackColor, width: k1H)),
      child: Text(
        DateFormat.jm().format(DateTime.now()),
        style: TextStyle(fontSize: k16Sp,color: isSelected?kWhiteColor:kBlackColor,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
