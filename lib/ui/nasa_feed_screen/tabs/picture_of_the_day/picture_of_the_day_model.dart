import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:nasa_app/services/models/picture.dart';
import 'package:nasa_app/services/picture_service.dart';

class PictureOfTheDayModel extends ElementaryModel {
  final ValueNotifier<Picture?> picture = ValueNotifier(null);

  final PictureService _pictureService;

  PictureOfTheDayModel(this._pictureService);

  Future<void> getPictureOfTheDay() async {
    final value = await _pictureService.getPictureOfTheDay();
    picture.value = value;
  }

  Future<void> updatePicture() async {
    final value = await _pictureService.updatePicture();
    picture.value = value;
  }
}