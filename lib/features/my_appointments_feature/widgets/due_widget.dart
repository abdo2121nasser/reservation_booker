import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';

class DueWidget extends StatelessWidget {
  const DueWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: k10H,vertical: k5V),
      decoration: BoxDecoration(
          color: kLightGreenColor,
          borderRadius: BorderRadius.circular(k20R)),
      child: Text(
        'Tomorrow',
        style: TextStyle(color: kGreenColor),
      ),
    );
  }
}
