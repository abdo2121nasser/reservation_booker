import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import 'custom_cashed_avatar_widget.dart';

class CircleBorderedAvatarWidget extends StatelessWidget {
  final BoxConstraints constrains;
 final String avatarUrl;
  const CircleBorderedAvatarWidget({
    super.key,
    required this.constrains,
    required this.avatarUrl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: k10H),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: k4H, color: kWhiteColor)),
      child: CustomCashedAvatarWidget(
          imageLink:
          avatarUrl,
          constraints: constrains),
    );
  }
}
