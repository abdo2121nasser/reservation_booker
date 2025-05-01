import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import '../../../core/utils/values/font_size.dart';
import '../cubits/authentication_switch_cubit/authentication_switch_cubit.dart';
import '../entities/authentication_state_entity.dart';

import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import '../../../core/utils/values/font_size.dart';
import '../cubits/authentication_switch_cubit/authentication_switch_cubit.dart';
import '../entities/authentication_state_entity.dart';

class CustomSwitchWidget extends StatelessWidget {
  final bool isSignIn;
  const CustomSwitchWidget({super.key, required this.isSignIn});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(k5H),
      width: double.infinity,
      height: MediaQuery.maybeOf(context)!.size.height * 0.075,
      decoration: BoxDecoration(
        color: kSwitchBackGroundColor,
        borderRadius: BorderRadius.circular(k10R),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                AuthenticationSwitchCubit.get(context)
                    .changeAuthenticationState(
                        authenticationState:
                            SignInSwitchAuthenticationStateEntity());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSignIn ? kBlueColor : kWhiteColor,
                  borderRadius: BorderRadius.circular(k10R),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: k16Sp,
                    color: isSignIn ? kWhiteColor : kBlueColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: k10H),
          Expanded(
            child: InkWell(
              onTap: () {
                AuthenticationSwitchCubit.get(context)
                    .changeAuthenticationState(
                        authenticationState:
                            SignUpSwitchAuthenticationStateEntity());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSignIn ? kWhiteColor : kBlueColor,
                  borderRadius: BorderRadius.circular(k10R),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: k16Sp,
                    color: isSignIn ? kBlueColor : kWhiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
