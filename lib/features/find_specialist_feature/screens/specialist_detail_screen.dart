import 'package:flutter/material.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/custom_app_bar_widget.dart';

import '../widgets/specialist_detail_screen_body_widget.dart';

class SpecialistDetailScreen extends StatelessWidget {
  final SpecialistEntity specialistEntity;
  const SpecialistDetailScreen({super.key,required this.specialistEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(),// take care there is 2 widgets with the same name file
      body: SpecialistDetailScreenBodyWidget(specialistEntity: specialistEntity),
    );
  }
}




