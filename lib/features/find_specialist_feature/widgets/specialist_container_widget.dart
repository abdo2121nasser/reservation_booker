import 'package:flutter/material.dart';
import 'package:reservation_booker/configuration/routes.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_information_widget.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/strings/strings.dart';
import '../../../core/utils/values/app_size.dart';
import 'custom_cashed_avatar_widget.dart';

class SpecialistContainerWidget extends StatelessWidget {
  final SpecialistEntity specialistEntity;
  const SpecialistContainerWidget({
    super.key,
    required this.specialistEntity
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AppRoute.router.push(AppRoute.specialistDetailScreen,extra: specialistEntity);
      },
      child: Container(
        width: double.maxFinite,
        height: k90V,
        padding: EdgeInsets.symmetric(horizontal: k10H, vertical: k10V),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(k14R),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 4), // Shadow position
            ),
          ],
        ),
        child: LayoutBuilder(builder: (context, constrain) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCashedAvatarWidget(
                imageLink: specialistEntity.data.avatarUrl,
                constraints: constrain,
              ),
              SizedBox(width: k10H,),
              SpecialistInformationWidget(
                constraints: constrain,
                dataEntity: specialistEntity.data,
              ),
            ],
          );
        }),
      ),
    );
  }
}
