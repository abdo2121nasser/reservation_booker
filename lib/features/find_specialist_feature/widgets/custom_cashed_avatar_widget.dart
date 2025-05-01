import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/values/app_size.dart';

import '../../../core/utils/component/general_image_cash_block.dart';
import '../../../core/utils/strings/strings.dart';

class CustomCashedAvatarWidget extends StatelessWidget {
  final String imageLink;
  final BoxConstraints constraints;
  const CustomCashedAvatarWidget({super.key,
  required this.imageLink,
    required this.constraints
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth*0.25,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(k100R),
        child:  GeneralImageCacheBlock(link: imageLink),

      ),
    );
  }
}
