import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:sqflite_tutorial/theme/appLightTheme.dart';

class ThemeState extends GetxController {
  Locale locale =Get.deviceLocale.toString() =='en'?  Locale('en', 'US'): Locale('tr', 'TR');

  ThemeData currentTheme = appLightTheme;

  changeAppTheme(ThemeData themeData) {
    currentTheme = themeData;

    update();
    Get.changeTheme(themeData);
  }

  changeLocale(Locale newLocale) {
    locale = newLocale;
    Get.locale = newLocale;
    update();
  }
}
