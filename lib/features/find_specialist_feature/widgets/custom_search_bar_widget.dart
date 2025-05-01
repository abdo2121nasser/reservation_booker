import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/colors/colors.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/core/utils/values/app_size.dart';

import '../../../core/utils/values/font_size.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: kSearchBarHint,
      leading: const Icon(
        CupertinoIcons.search,
        color: kLightGreyColor,
      ),
      elevation: const WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(k30R),
          side: const BorderSide(color: kLightGreyColor),
        ),
      ),
      backgroundColor: const WidgetStatePropertyAll(kBackgroundColor),
      textStyle: WidgetStatePropertyAll(
        TextStyle(color: kLightGreyColor, fontSize: k18Sp),
      ),
      padding: WidgetStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: k12H),
      ),
    );
  }
}
