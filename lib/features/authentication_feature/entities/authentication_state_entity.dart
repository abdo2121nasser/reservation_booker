import 'package:flutter/cupertino.dart';

import '../widgets/sign_in_widgets/sign_in_button_widget.dart';
import '../widgets/sign_in_widgets/sign_in_form_widget.dart';
import '../widgets/sign_up_widgets/sign_up_button_widget.dart';
import '../widgets/sign_up_widgets/sign_up_form_widget.dart';

sealed class AuthenticationStateEntity {
  final Widget form;
  final Widget button;

  const AuthenticationStateEntity({
    required this.form,
    required this.button,
  });
}

class SignInSwitchAuthenticationStateEntity extends AuthenticationStateEntity {
  SignInSwitchAuthenticationStateEntity()
      : super(
    form:  SignInFormWidget(),
    button: const SignInButtonWidget(),
  );
}

class SignUpSwitchAuthenticationStateEntity extends AuthenticationStateEntity {
  SignUpSwitchAuthenticationStateEntity()
      : super(
    form:  SignUpFormWidget(),
    button: const SignUpButtonWidget(),
  );
}

