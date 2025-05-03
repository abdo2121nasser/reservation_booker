import 'package:flutter/material.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_information_widget.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import '../entities/specialist_entity.dart';
import 'circle_bordered_avatar_widget.dart';

class SpecialistProfileSectionWidget extends StatelessWidget {
  const SpecialistProfileSectionWidget({
    super.key,
    required this.dataEntity,
  });

  final DataEntity dataEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: k110V,
      decoration:const BoxDecoration(color: kLightBlueColor),
      child: LayoutBuilder(builder: (context, constrains) {
        return Row(
          children: [
            CircleBorderedAvatarWidget(constrains: constrains,avatarUrl: dataEntity.avatarUrl,),
            SpecialistInformationWidget(
              constraints: constrains,
              dataEntity: dataEntity,
              isBigSize: true,
            )
          ],
        );
      }),
    );
  }
}
