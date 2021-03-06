import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/di/injector_widget.dart';
import 'package:nasa_app/services/models/picture.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/picture_of_the_day/picture_of_the_day_model.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/picture_of_the_day/picture_of_the_day_wm.dart';

abstract class IPictureOfTheDayWM implements IWidgetModel {
  ValueListenable<Picture?> get picture;

  String get randomButtonTitle;

  void onRandomButtonTap();
}

PictureOfTheDayWM createPictureOfTheDayWM(BuildContext context) =>
    PictureOfTheDayWM(
      PictureOfTheDayModel(InjectorWidget.maybeOf(context)?.pictureService),
    );
