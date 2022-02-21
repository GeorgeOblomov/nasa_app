import 'package:flutter/material.dart';
import 'package:nasa_app/di/injector_widget.dart';
import 'package:nasa_app/nasa_app.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final injector = InjectorWidget(child: const NasaApp());
  await injector.init();

  runApp(injector);
}