import 'package:flutter/material.dart';

import '../widgets/category_list_view_widget.dart';
import '../widgets/custom_search_bar_widget.dart';
import '../widgets/special_container_list_view_widget.dart';

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



