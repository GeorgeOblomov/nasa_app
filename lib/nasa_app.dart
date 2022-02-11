import 'package:flutter/material.dart';
import 'package:nasa_app/ui/nasa_home_screen/nasa_home_screen.dart';
import 'package:nasa_app/utils/app_colors.dart';

class NasaApp extends StatelessWidget {
  const NasaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NASA API app',
      theme: ThemeData(
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: progressIndicatorColor),
      ),
      home: NasaHomeScreen(),
    );
  }
}
