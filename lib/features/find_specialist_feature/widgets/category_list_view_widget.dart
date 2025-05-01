import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/category_entity.dart';

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
    CategoryEntity(category: kCategoryTherapy, isSelected: false),
    CategoryEntity(category: kCategoryCoaching, isSelected: false),
    CategoryEntity(category: kCategoryFitness, isSelected: false),
    CategoryEntity(category: kCategoryNutrition, isSelected: false),
    CategoryEntity(category: kCategoryWellness, isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: k10V),
      child: SizedBox(
        height: k60V,
        child: Scrollbar(
          controller: _scrollController,
          radius: Radius.circular(k20R),
          interactive: true,
          thumbVisibility: true,
          child: ListView.separated(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: k14V),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    _categories
                        .firstWhere((element) => element.isSelected == true)
                        .isSelected = false;
                    _categories[index].isSelected = true;
                  });
                },
                child: CategoryItemWidget(categoryEntity: _categories[index])),
            separatorBuilder: (context, index) => SizedBox(width: k5H),
            itemCount: _categories.length,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
