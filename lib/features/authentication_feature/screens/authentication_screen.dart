import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_booker/core/utils/colors/colors.dart';
import 'package:reservation_booker/core/utils/images.dart';

import '../../../core/utils/values/app_size.dart';
import '../cubits/authentication_switch_cubit/authentication_switch_cubit.dart';
import '../widgets/authentication_body_widget.dart';
import '../widgets/custom_switch_widget.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AuthenticationBodyWidget(),
      );
  }
}




