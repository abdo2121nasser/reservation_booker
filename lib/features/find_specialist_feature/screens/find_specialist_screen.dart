import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/colors/colors.dart';
import 'package:reservation_booker/core/utils/component/general_text_form_field.dart';
import 'package:reservation_booker/core/utils/values/app_size.dart';
import 'package:reservation_booker/core/utils/values/font_size.dart';

import '../widgets/category_item_widget.dart';
import '../widgets/category_list_view_widget.dart';
import '../widgets/custom_search_bar_widget.dart';

class FindSpecialistScreen extends StatelessWidget {
  const FindSpecialistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
      CustomSearchBar(),
        CategoryListViewWidget(),





      ],
    );
  }
}


