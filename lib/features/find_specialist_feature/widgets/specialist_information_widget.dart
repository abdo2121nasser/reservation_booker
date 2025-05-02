import 'package:flutter/material.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_rate_widget.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/font_size.dart';

class SpecialistInformationWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final SpecialistEntity specialistEntity;
    final bool isBigSize;
  const SpecialistInformationWidget({
    super.key,
    required this.constraints,
    required this.specialistEntity,
    this.isBigSize=false
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // width: constraints.maxWidth*0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           specialistEntity.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:isBigSize?k25Sp: k16Sp,
                color: kBlackColor),
          ),
          Text(
            specialistEntity.category,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: isBigSize?k20Sp:k14Sp, color: kLightGreyColor),
          ),
          const Spacer(),
           SpecialistRateWidget(rate: specialistEntity.rate.floor(),),
          const Spacer()
        ],
      ),
    );
  }
}
