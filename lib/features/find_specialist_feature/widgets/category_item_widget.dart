import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/category_entity.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import '../../../core/utils/values/font_size.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryEntity categoryEntity;
  const CategoryItemWidget({
    super.key,
    required this.categoryEntity

  });
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: Colors.transparent, // Let the container handle the color
      borderRadius: BorderRadius.circular(k30R), // Make shadow follow corners
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: k14H),
        decoration: BoxDecoration(
          color: categoryEntity.isSelected?kBlueColor:kWhiteColor,
          borderRadius: BorderRadius.circular(k30R),
        ),
        child: Text(
          categoryEntity.category,
          style: TextStyle(
            fontSize: k18Sp,
            color: categoryEntity.isSelected?kWhiteColor: kBlackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
