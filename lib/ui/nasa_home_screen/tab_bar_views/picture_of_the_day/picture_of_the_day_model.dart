import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:nasa_app/services/picture_service.dart';
import 'package:nasa_app/ui/nasa_home_screen/tab_bar_views/picture_of_the_day/widgets/picture.dart';

class PictureOfTheDayModel extends ElementaryModel {
  final ValueNotifier<Picture?> picture = ValueNotifier(null);

  final PictureService _pictureService;

  PictureOfTheDayModel(this._pictureService);

  Future<void> getPictureOfTheDay() async {
    final value = await _pictureService.getPictureOfTheDay();
    picture.value = value;
  }
}