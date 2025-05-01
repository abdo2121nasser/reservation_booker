import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';

import '../../../core/utils/colors/colors.dart';
import '../cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';

class CustomBottomNavigationBarWidget extends StatelessWidget {
  const CustomBottomNavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex:
              BottomNavigationBarCubit.get(context).getCurrentBodyWithIndex,
          onTap: (index) {
            BottomNavigationBarCubit.get(context).setCurrentBodyWithIndex =
                index;
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: kFirstBottomNavigationBarItem),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: kSecondBottomNavigationBarItem),
          ],
        );
      },
    );
  }
}
