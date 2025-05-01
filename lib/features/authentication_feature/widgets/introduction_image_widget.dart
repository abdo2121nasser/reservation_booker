import 'package:flutter/cupertino.dart';

import '../../../core/utils/images.dart';
import '../../../core/utils/values/app_size.dart';

class IntroductionImageWidget extends StatelessWidget {
  const IntroductionImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.maybeOf(context)!.size.height*0.3,
      width: double.maxFinite,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(k10R),
        child: Image.asset(
          kReservationImageAsset,
          fit: BoxFit.cover, // or BoxFit.fitWidth if you want it to stretch horizontally
        ),
      ),
    );
  }
}
