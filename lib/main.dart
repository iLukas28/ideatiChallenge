import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideati_ilukas/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'ideati',
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          /* dark theme settings */
        ),
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
