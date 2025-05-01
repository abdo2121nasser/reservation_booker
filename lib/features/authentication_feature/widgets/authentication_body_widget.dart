import 'package:flutter/cupertino.dart';
import 'authentication_content_widget.dart';
import 'introduction_widget.dart';

class AuthenticationBodyWidget extends StatelessWidget {
  const AuthenticationBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IntroductionWidget(),
          AuthenticationContentWidget(),


        ],
      ),
    );
  }
}
