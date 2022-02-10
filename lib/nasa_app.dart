import 'package:flutter/material.dart';
import 'package:nasa_app/ui/nasa_home_screen/nasa_home_screen.dart';

class NasaApp extends StatelessWidget {

  const NasaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NASA API app',
      home: NasaHomeScreen(),
    );
  }
}