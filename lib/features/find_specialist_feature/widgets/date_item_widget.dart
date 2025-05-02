import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import '../../../core/utils/values/font_size.dart';

class DateItemWidget extends StatelessWidget {
  final DateTime dateTime;
  final bool isSelected;
  const DateItemWidget(
      {super.key, required this.dateTime, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final String dayName = DateFormat.E().format(dateTime); //  "Fri"
    final String day = DateFormat.d().format(dateTime); //  "2"
    final String month = DateFormat.MMM().format(dateTime); //  "May"

    return Container(
      padding: EdgeInsets.symmetric(horizontal: k10H, vertical: k5V),
      decoration: BoxDecoration(
          color: isSelected ? kBlueColor : kWhiteColor,
          borderRadius: BorderRadius.circular(k14R),
          border:
              isSelected ? null : Border.all(color: kBlackColor, width: k1H)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            dayName,
            style: TextStyle(
              fontSize: k16Sp,
              color: isSelected ? kWhiteColor : kBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            day,
            style: TextStyle(
              fontSize: k20Sp,
              color: isSelected ? kWhiteColor : kBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            month,
            style: TextStyle(
              fontSize: k16Sp,
              color: isSelected ? kWhiteColor : kBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
