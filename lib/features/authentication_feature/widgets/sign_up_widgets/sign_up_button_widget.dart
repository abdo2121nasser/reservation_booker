import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_booker/features/authentication_feature/cubits/sign_up_cubits/sign_up_cubit.dart';
import 'package:reservation_booker/features/authentication_feature/cubits/sign_up_cubits/sign_up_cubit.dart';
import 'package:reservation_booker/features/authentication_feature/models/sign_up_model.dart';
import 'package:reservation_booker/features/authentication_feature/repository/sign_up_repository.dart';
import 'package:reservation_booker/features/authentication_feature/widgets/sign_up_widgets/sign_up_form_widget.dart';

import '../../../../configuration/routes.dart';
import '../../../../core/utils/colors/colors.dart';
import '../../../../core/utils/component/general_button_widget.dart';
import '../../../../core/utils/component/toast_message_function.dart';
import '../../../../core/utils/values/app_size.dart';
import '../../cubits/authentication_switch_cubit/authentication_switch_cubit.dart';

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocBuilder<AuthenticationSwitchCubit, AuthenticationSwitchState>(
        builder: (authenticationContext, authenticationCubitState) {
          var formState = authenticationCubitState.authenticationState.form
          as SignUpFormWidget;
          return BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              if (state is SignUpLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else {
                return GeneralButtonWidget(
                  label: 'Sign Up',
                  function: () {
                    if (formState.validateForm()) {
                      SignUpCubit.get(authenticationContext).signUp(
                          signUpRepository: SignUpWithFireBase(
                              signUpModel: SignUpModel(
                                email: formState.emailController.text,
                                password: formState.passwordController.text,
                              )));
                    }
                  },
                  size: Size(double.maxFinite, k20V),
                  textColor: kWhiteColor,
                  backgroundColor: kBlueColor,
                  borderRadius: k10R);
              }
            },
          );
        },
      ),
    );
  }
}
