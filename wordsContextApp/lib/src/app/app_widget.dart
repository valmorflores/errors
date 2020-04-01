import 'package:flutter/material.dart';
import 'package:wordsContextApp/src/pages/api/home/home_api_module.dart';
import 'package:wordsContextApp/src/shared/globals.dart';
import 'package:wordsContextApp/src/shared/themes/dark_theme_colors.dart';
import 'package:wordsContextApp/src/shared/themes/light_theme_colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary Seeker (dictAPI)',
      theme: Globals.isDark ? darkTheme: lightTheme,
      home: HomeApiModule(),
      debugShowCheckedModeBanner: false,
    );
  }
}
