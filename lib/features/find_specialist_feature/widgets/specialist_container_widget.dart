import 'package:flutter/material.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_information_widget.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/strings/strings.dart';
import '../../../core/utils/values/app_size.dart';
import 'custom_cashed_avatar_widget.dart';

class SpecialistContainerWidget extends StatelessWidget {
  const SpecialistContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: k90V,
      padding: EdgeInsets.symmetric(horizontal: k10H, vertical: k10V),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(k14R),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: LayoutBuilder(builder: (context, constrain) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomCashedAvatarWidget(
              imageLink: kSmileManLink,
              constraints: constrain,
            ),
            SizedBox(width: k10H,),
            SpecialistInformationWidget(
              constraints: constrain,
            ),
          ],
        );
      }),
    );
  }
}
