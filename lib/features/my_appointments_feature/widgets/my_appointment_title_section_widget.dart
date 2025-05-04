import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/colors/colors.dart';
import 'package:reservation_booker/core/utils/values/app_size.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/custom_cashed_avatar_widget.dart';
import '../../find_specialist_feature/widgets/specialist_information_widget.dart';

class MyAppointmentTitleSectionWidget extends StatelessWidget {
  final BoxConstraints constrains;
  const MyAppointmentTitleSectionWidget({super.key, required this.constrains});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomCashedAvatarWidget(
            imageLink: 'https://randomuser.me/api/portraits/women/44.jpg',
            constrains: constrains * 0.8),
        SizedBox(
          width: k10H,
        ),
        SpecialistInformationWidget(
          constraints: constrains,
          dataEntity: DataEntity(
              specialistDocId: '',
              name: 'steve',
              category: 'thereabpist',
              rate: 5,
              avatarUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
              about: 'about'),
        ),
        SizedBox(
          width: k10H,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.clear,
              color: kRedColor,
            ))
      ],
    );
  }
}
