import 'package:flutter/material.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_rate_widget.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/font_size.dart';

class SpecialistInformationWidget extends StatelessWidget {
  final BoxConstraints constraints;

  const SpecialistInformationWidget({
    super.key,
    required this.constraints
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth*0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Johnson Sarah .re.',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: k16Sp,
                color: kBlackColor),
          ),
          Text(
            'Therapy',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: k14Sp, color: kLightGreyColor),
          ),
          const Spacer(),
          const SpecialistRateWidget(rate: 4,),
          const Spacer()
        ],
      ),
    );
  }
}
