import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/colors/colors.dart';

import '../../../core/utils/strings/strings.dart';
import '../../../core/utils/values/app_size.dart';
import '../../../core/utils/values/font_size.dart';

class SpecialistAboutSectionWidget extends StatelessWidget {
  final String content;
  const SpecialistAboutSectionWidget({
    super.key,
    required this.content
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: k14H, vertical: k20V),
      color: kWhiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            kAboutWord,
            style: TextStyle(
                fontSize: k20Sp,
                color: kBlackColor,
                fontWeight: FontWeight.bold),
          ),
          Text(content,
            style: TextStyle(fontSize: k16Sp, color: kBlackColor),
          ),
        ],
      ),
    );
  }
}
