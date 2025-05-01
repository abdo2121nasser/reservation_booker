import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../configuration/routes.dart';
import '../../../../core/services/validator_service.dart';
import '../../../../core/utils/colors/colors.dart';
import '../../../../core/utils/component/custom_full_input_block.dart';
import '../../../../core/utils/values/app_size.dart';
import '../../../../core/utils/values/font_size.dart';
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
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                },
                child: Text(
                  'هل نسيت كلمه المرور؟',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: k16Sp,
                      fontWeight: FontWeight.bold,
                      color: kDarkBlueColor),
                ),
              ),
            ),
          ],
        ));
  }
  bool validateForm() => _globalKey.currentState?.validate() ?? false;

}
