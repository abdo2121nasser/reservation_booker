import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_booker/core/utils/colors/colors.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/core/utils/values/app_size.dart';
import 'package:reservation_booker/features/find_specialist_feature/cubits/find_specialist_cubit/find_specialist_cubit.dart';
import 'package:reservation_booker/features/find_specialist_feature/repositries/get_specialists.dart';
import 'package:reservation_booker/features/find_specialist_feature/screens/find_specialist_screen.dart';

import '../../../core/utils/values/font_size.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<ChangeCategoryNotifier>();

    return SearchBar(
      onSubmitted: (value) {
        FindSpecialistCubit.get(context).filterSpecialist(
            specialistsRepository: GetFilteredSpecialistsByNameFromHive(
                filteredName: _searchController.text));
        _searchController.clear();
        notifier.resetToAll();
      },
      controller: _searchController,
      hintText: kSearchBarHint,
      leading: const Icon(
        CupertinoIcons.search,
        color: kLightGreyColor,
      ),
      elevation: const WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(k30R),
          side: const BorderSide(color: kLightGreyColor),
        ),
      ),
      backgroundColor: const WidgetStatePropertyAll(kBackgroundColor),
      textStyle: WidgetStatePropertyAll(
        TextStyle(color: kBlackColor, fontSize: k18Sp),
      ),
      hintStyle: WidgetStatePropertyAll(
        TextStyle(color: kLightGreyColor, fontSize: k18Sp),
      ),
      padding: WidgetStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: k12H),
      ),
    );
  }
}
