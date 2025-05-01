
import 'package:fluttertoast/fluttertoast.dart';

import '../colors/colors.dart';
import '../values/font_size.dart';

void showToastMessage({required String message}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: kWhiteColor,
      backgroundColor: kDarkBlueColor,
      fontSize: k16Sp
  );
}