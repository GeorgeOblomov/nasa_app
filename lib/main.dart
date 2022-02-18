import 'package:flutter/material.dart';
import 'package:nasa_app/di/injector_widget.dart';
import 'package:nasa_app/nasa_app.dart';

void main() {
  final injector = InjectorWidget(child: const NasaApp())
    ..init();

  runApp(injector);
}