import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/values/app_size.dart';
import '../custom_email_widget.dart';
import '../custom_password_widget.dart';

class SignInFormWidget extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  SignInFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _globalKey,
        child: Column(
          children: [
            CustomEmailWidget(controller: emailController,),
            SizedBox(
              height: k14V,
            ),
            CustomPasswordWidget(controller: passwordController),
            SizedBox(
              height: k5V,
            ),
          ],
        ));
  }
  bool validateForm() => _globalKey.currentState?.validate() ?? false;

}
