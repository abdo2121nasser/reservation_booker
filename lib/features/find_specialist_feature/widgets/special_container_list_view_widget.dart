import 'package:flutter/material.dart';
import 'package:reservation_booker/features/find_specialist_feature/cubits/find_specialist_cubit/find_specialist_cubit.dart';
import 'package:reservation_booker/features/find_specialist_feature/repositries/get_specialists.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_container_widget.dart';
import '../../../core/utils/values/app_size.dart';
import '../entities/specialist_entity.dart';

class SpecialContainerListViewWidget extends StatelessWidget {
  final List<SpecialistEntity> specialists;
  const SpecialContainerListViewWidget({super.key, required this.specialists});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          FindSpecialistCubit.get(context).getSpecialists(
              specialistsRepository: GetAllSpecialistsFromFireBase());
        },
        child: ListView.separated(
            itemBuilder: (context, index) => SpecialistContainerWidget(
              specialistEntity: specialists[index],
            ),
            separatorBuilder: (context, index) => SizedBox(
                  height: k10V,
                ),
            itemCount: specialists.length),
      ),
    );
  }
}
