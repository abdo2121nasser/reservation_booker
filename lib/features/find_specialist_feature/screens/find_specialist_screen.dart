import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/colors/colors.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/core/utils/values/app_size.dart';
import 'package:reservation_booker/core/utils/values/font_size.dart';

import '../../../core/utils/component/general_image_cash_block.dart';
import '../widgets/category_list_view_widget.dart';
import '../widgets/custom_cashed_avatar_widget.dart';
import '../widgets/custom_search_bar_widget.dart';
import '../widgets/special_container_list_view_widget.dart';
import '../widgets/specialist_container_widget.dart';
import '../widgets/specialist_information_widget.dart';
import '../widgets/specialist_rate_widget.dart';

class FindSpecialistScreen extends StatelessWidget {
  const FindSpecialistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchBar(),
        CategoryListViewWidget(),
        SpecialContainerListViewWidget()
      ],
    );
  }
}



