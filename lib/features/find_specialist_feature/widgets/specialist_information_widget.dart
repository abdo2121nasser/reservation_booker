import 'package:flutter/material.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_rate_widget.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/font_size.dart';

class SpecialistInformationWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final SpecialistEntity specialistEntity;

  const SpecialistInformationWidget({
    super.key,
    required this.constraints,
    required this.specialistEntity
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth*0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           specialistEntity.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: k16Sp,
                color: kBlackColor),
          ),
          Text(
            specialistEntity.category,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: k14Sp, color: kLightGreyColor),
          ),
          const Spacer(),
           SpecialistRateWidget(rate: specialistEntity.rate.floor(),),
          const Spacer()
        ],
      ),
    );
  }
}
