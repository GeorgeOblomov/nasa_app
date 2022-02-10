import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/services/picture_service.dart';
import 'package:nasa_app/ui/nasa_home_screen/tab_bar_views/picture_of_the_day/picture_of_the_day_model.dart';
import 'package:nasa_app/ui/nasa_home_screen/tab_bar_views/picture_of_the_day/picture_of_the_day_wm.dart';
import 'package:nasa_app/ui/nasa_home_screen/tab_bar_views/picture_of_the_day/widgets/picture.dart';

abstract class IPictureOfTheDayWM implements IWidgetModel {
  ValueListenable<Picture> get picture;
}

PictureOfTheDayWM createPictureOfTheDayWM(BuildContext _) => PictureOfTheDayWM(
  PictureOfTheDayModel(
    PictureService(),
  ),
);