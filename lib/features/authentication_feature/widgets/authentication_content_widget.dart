import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/values/app_size.dart';
import '../cubits/authentication_switch_cubit/authentication_switch_cubit.dart';
import 'custom_switch_widget.dart';

class AuthenticationContentWidget extends StatelessWidget {
  const AuthenticationContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: k20H, vertical: k14V),
      child: BlocProvider(
        create: (context) => AuthenticationSwitchCubit(),
        child: BlocBuilder<AuthenticationSwitchCubit, AuthenticationSwitchState>(
          builder: (context, state) {
            return Column(
              children: [
                CustomSwitchWidget(
                  isSignIn: state.isSignInState,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: k10V),
                  child: state.authenticationState.form,
                ),

                state.authenticationState.button
              ],
            );
          },
        ),
      ),
    );
  }
}
