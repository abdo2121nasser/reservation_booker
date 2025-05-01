import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/core/utils/values/font_size.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import 'introduction_image_widget.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: k35H, vertical: k20V),
      decoration:const BoxDecoration(color: kLightBlueColor),
      child: Column(
        children: [
          const IntroductionImageWidget(),
          Text(
            kIntroductionTitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: k25Sp, fontWeight: FontWeight.bold),
          ),
          Text(
           kIntroductionSubTitle ,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: k16Sp, color: kLightGreyColor),
          ),
        ],
      ),
    );
  }
}
