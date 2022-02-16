import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:nasa_app/services/models/picture.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/picture_of_the_day/i_picture_of_the_day_wm.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/picture_of_the_day/picture_of_the_day_model.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/picture_of_the_day/picture_of_the_day_widget.dart';

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
  void onRandomButtonTap() {
    model.updatePicture();
  }
}
