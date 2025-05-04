import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_booker/configuration/routes.dart';

import '../cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/font_size.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {


  const CustomAppBarWidget({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        var botCubit=BottomNavigationBarCubit.get(context);
        return AppBar(
          actions:  [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  AppRoute.router.pushReplacement(AppRoute.authenticationScreen);
                },
                icon: const Icon(
                  Icons.logout,
                  color: kLightGreyColor,
                ))
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    botCubit.getCurrentTitleWithIndex,
                    style: TextStyle(
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: k20Sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    botCubit.getCurrentSubTitleWithIndex,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: kLightGreyColor,
                      fontSize: k14Sp,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
