import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_container_widget.dart';

import '../../../core/utils/values/app_size.dart';
import '../entities/specialist_entity.dart';

class SpecialContainerListViewWidget extends StatelessWidget {
  final List<SpecialistEntity> specialists;
  const SpecialContainerListViewWidget({super.key, required this.specialists});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) => InkWell(
              onTap: () async {},
              child: SpecialistContainerWidget(
                specialistEntity: specialists[index],
              )),
          separatorBuilder: (context, index) => SizedBox(
                height: k10V,
              ),
          itemCount: specialists.length),
    );
  }
}
