
import 'package:fluttertoast/fluttertoast.dart';

import '../colors/colors.dart';
import '../values/font_size.dart';

void showToastMessage({required String message}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: kWhiteColor,
      backgroundColor: kBlueColor,
      fontSize: k16Sp
  );
}