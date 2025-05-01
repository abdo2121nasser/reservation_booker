import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_booker/core/utils/colors/colors.dart';
import 'package:reservation_booker/features/main_feature/widgets/custom_app_bar_widget.dart';
import 'package:reservation_booker/core/utils/component/custom_title_widget.dart';
import 'package:reservation_booker/core/utils/values/app_size.dart';
import 'package:reservation_booker/features/main_feature/cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:reservation_booker/features/main_feature/widgets/custom_bottom_navigation_bar_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBarCubit(),
      child: Scaffold(
        appBar:const CustomAppBarWidget(),
        body: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
          builder: (context, state) {
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: k20H,vertical: k10V),
              child: state.body,
            );
          },
        ),

        bottomNavigationBar:const CustomBottomNavigationBarWidget(),
      ),
    );
  }
}
