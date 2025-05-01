
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../configuration/routes.dart';
import '../core/utils/colors/colors.dart';


class ReservationApp extends StatelessWidget {
  const ReservationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => DevicePreview(
        enabled: true,
        builder: (context) => SafeArea(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRoute.router,
            theme: _getLightTheme,
          ),
        ),
      ),
    );
  }

  ThemeData get _getLightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: kBackgroundColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: kWhiteColor,
        selectedItemColor: kBlueColor,
        unselectedItemColor: kLightGreyColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: kBackgroundColor,
        iconTheme: IconThemeData(color: kBlueColor),
      ),
    );
  }

}
