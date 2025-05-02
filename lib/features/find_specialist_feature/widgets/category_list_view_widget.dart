import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/features/find_specialist_feature/cubits/find_specialist_cubit/find_specialist_cubit.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/category_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/repositries/get_specialists.dart';
import '../../../core/utils/values/app_size.dart';
import 'category_item_widget.dart';

class CategoryListViewWidget extends StatefulWidget {
  const CategoryListViewWidget({super.key});

  @override
  State<CategoryListViewWidget> createState() => _CategoryListViewWidgetState();
}

class _CategoryListViewWidgetState extends State<CategoryListViewWidget> {
  final ScrollController _scrollController = ScrollController();
  final List<CategoryEntity> _categories = [
    CategoryEntity(category: kCategoryAll, isSelected: true),
    CategoryEntity(category: kCategoryCardiologist, isSelected: false),
    CategoryEntity(category: kCategoryDermatologist, isSelected: false),
    CategoryEntity(category: kCategoryPediatrician, isSelected: false),
    CategoryEntity(category: kCategoryOrthopedic, isSelected: false),
    CategoryEntity(category: kCategoryNeurologist, isSelected: false),
    CategoryEntity(category: kCategoryPsychiatrist, isSelected: false),
    CategoryEntity(category: kCategoryGynecologist, isSelected: false),
    CategoryEntity(category: kCategoryOncologist, isSelected: false),
    CategoryEntity(category: kCategoryEndocrinologist, isSelected: false),
    CategoryEntity(category: kCategoryOphthalmologist, isSelected: false),
    CategoryEntity(category: kCategoryRheumatologist, isSelected: false),
    CategoryEntity(category: kCategoryUrologist, isSelected: false),
    CategoryEntity(category: kCategoryAllergist, isSelected: false),
    CategoryEntity(category: kCategoryGastroenterologist, isSelected: false),
    CategoryEntity(category: kCategoryPulmonologist, isSelected: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: k16V),
      child: SizedBox(
        height: k60V,
        child: Scrollbar(
          controller: _scrollController,
          radius: Radius.circular(k20R),
          interactive: true,
          thumbVisibility: true,
          thickness: k5V,
          child: ListView.separated(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: k14V),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  _changeCategory(index, context);
                },
                child: CategoryItemWidget(categoryEntity: _categories[index])),
            separatorBuilder: (context, index) => SizedBox(width: k5H),
            itemCount: _categories.length,
          ),
        ),
      ),
    );
  }

  void _changeCategory(int index, BuildContext context) {
    return setState(() {
      _categories
          .firstWhere((element) => element.isSelected == true)
          .isSelected = false;
      _categories[index].isSelected = true;
      if (_categories[index].category == kCategoryAll) {
        FindSpecialistCubit.get(context)
            .getSpecialists(specialistsRepository: GetSpecialistsFromHive());
      } else {
        FindSpecialistCubit.get(context).filterSpecialist(
            specialistsRepository: GetFilteredSpecialistsByCategoryFromHive(
                filteredCategory: _categories[index].category));
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
