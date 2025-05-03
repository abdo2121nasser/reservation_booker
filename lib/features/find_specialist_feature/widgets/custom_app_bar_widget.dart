import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_booker/configuration/routes.dart';
import 'package:reservation_booker/core/utils/values/app_size.dart';
import 'package:reservation_booker/core/utils/values/font_size.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/strings/strings.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kLightBlueColor,
      automaticallyImplyLeading: false,
      leadingWidth:0,
      elevation: 0,
      title:  InkWell(
        onTap: (){
          AppRoute.router.pop();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(CupertinoIcons.back,color: kBlackColor,),
            Text(
              kSpecialistDetailTitle,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: k20Sp),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
