import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import 'custom_cashed_avatar_widget.dart';

class CircleBorderedAvatarWidget extends StatelessWidget {
  final BoxConstraints constrains;

  const CircleBorderedAvatarWidget({
    super.key,
    required this.constrains
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: k10H),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: k4V, color: kWhiteColor)),
      child: CustomCashedAvatarWidget(
          imageLink:
          'https://randomuser.me/api/portraits/men/52.jpg',
          constraints: constrains),
    );
  }
}
