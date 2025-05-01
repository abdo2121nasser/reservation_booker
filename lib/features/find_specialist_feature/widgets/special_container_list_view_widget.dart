import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_container_widget.dart';

import '../../../core/utils/values/app_size.dart';

class SpecialContainerListViewWidget extends StatelessWidget {
  const SpecialContainerListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) => InkWell(
              onTap: (){},
              child: const SpecialistContainerWidget()),
          separatorBuilder: (context, index) => SizedBox(height: k10V,),
          itemCount: 10),
    );
  }
}
