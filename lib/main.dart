import 'package:flutter/material.dart';
import 'package:sqflite_tutorial/theme/theme_state.dart';
import 'package:sqflite_tutorial/view/home_view.dart';
import 'package:get/get.dart';

import 'lang/translate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeState themeState = Get.put(ThemeState());

  @override
  Widget build(BuildContext context) {
    print(Get.deviceLocale);
    return GetMaterialApp(
      translations: Messages(),
      locale: themeState.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeState.currentTheme,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
