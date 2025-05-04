import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:reservation_booker/features/authentication_feature/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:reservation_booker/features/authentication_feature/entities/sign_in_entity.dart';
import 'package:reservation_booker/features/authentication_feature/repository/sign_in_repository.dart';
import 'package:reservation_booker/features/authentication_feature/widgets/sign_in_widgets/sign_in_form_widget.dart';
import '../../../../configuration/routes.dart';
import '../../../../core/utils/colors/colors.dart';
import '../../../../core/utils/component/general_button_widget.dart';
import '../../../../core/utils/values/app_size.dart';
import '../../cubits/authentication_switch_cubit/authentication_switch_cubit.dart';
import '../../models/sign_in_model.dart';

class SignInButtonWidget extends StatelessWidget {
  const SignInButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocBuilder<AuthenticationSwitchCubit, AuthenticationSwitchState>(
        builder: (authenticationContext, authenticationCubitState) {
          var formState = authenticationCubitState.authenticationState.form
              as SignInFormWidget;
          return BlocBuilder<SignInCubit, SignInState>(
            builder: (context, state) {
              if (state is SignInLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return GeneralButtonWidget(
                    label: 'Sign In',
                    function: () {
                      if (formState.validateForm()) {
                        SignInCubit.get(authenticationContext).signIn(
                            signInRepository: SignInWithFireBase(
                                signInEntity: SignInEntity(
                                    email: formState.emailController.text,
                                    password:
                                        formState.passwordController.text)));
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
