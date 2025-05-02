import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_booker/core/utils/colors/colors.dart';
import 'package:reservation_booker/core/utils/values/font_size.dart';
import 'package:reservation_booker/features/find_specialist_feature/cubits/find_specialist_cubit/find_specialist_cubit.dart';
import 'package:reservation_booker/features/find_specialist_feature/repositries/get_specialists.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/strings/strings.dart';
import '../entities/category_entity.dart';
import '../widgets/category_list_view_widget.dart';
import '../widgets/custom_search_bar_widget.dart';
import '../widgets/special_container_list_view_widget.dart';

class FindSpecialistScreen extends StatelessWidget {
  const FindSpecialistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      FindSpecialistCubit()
        ..initializeCubit(),
      child: ChangeNotifierProvider(
        create: (context) => ChangeCategoryNotifier(),
        child: Column(
          children: [
            CustomSearchBar(),
            const CategoryListViewWidget(),
            BlocBuilder<FindSpecialistCubit, FindSpecialistState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ));
                } else if (state is SuccessState) {
                  if (state.specialists.isNotEmpty) {
                    return SpecialContainerListViewWidget(
                      specialists: state.specialists,
                    );
                  } else {
                    return Expanded(
                        child: Center(
                            child: Text(
                              'Couldn\'t find Specialist',
                              style: TextStyle(
                                  color: kBlackColor,
                                  fontSize: k18Sp,
                                  fontWeight: FontWeight.bold),
                            )));
                  }
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}


class ChangeCategoryNotifier extends ChangeNotifier {

  CategoryEntity _selectedCategory = CategoryEntity(category: kCategoryAll, isSelected: true);

  CategoryEntity get selectedCategory => _selectedCategory;

  void changeCategory(CategoryEntity newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }

  void resetToAll() {
    _selectedCategory = CategoryEntity(category: kCategoryAll, isSelected: true);
    notifyListeners();
  }
}
