import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:nasa_app/services/models/picture.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_info_page/tab_bar_views/picture_of_the_day/i_picture_of_the_day_model.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_info_page/tab_bar_views/picture_of_the_day/picture_of_the_day_model.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_info_page/tab_bar_views/picture_of_the_day/picture_of_the_day_widget.dart';

class PictureOfTheDayWM
    extends WidgetModel<PictureOfTheDayWidget, PictureOfTheDayModel>
    implements IPictureOfTheDayWM {

  @override
  ValueListenable<Picture?> get picture => model.picture;

  PictureOfTheDayWM(PictureOfTheDayModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model.getPictureOfTheDay();
  }

  @override
  bool hasImage() => _verifyImage(model.picture.value);

  bool _verifyImage(Picture? picture) {
    return picture != null && picture.hdUrl != null;
  }
}
