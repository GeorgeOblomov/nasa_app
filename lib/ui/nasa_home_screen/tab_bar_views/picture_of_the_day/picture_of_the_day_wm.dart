import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:nasa_app/ui/nasa_home_screen/tab_bar_views/picture_of_the_day/i_picture_of_the_day_model.dart';
import 'package:nasa_app/ui/nasa_home_screen/tab_bar_views/picture_of_the_day/picture_of_the_day_model.dart';
import 'package:nasa_app/ui/nasa_home_screen/tab_bar_views/picture_of_the_day/picture_of_the_day_widget.dart';
import 'package:nasa_app/ui/nasa_home_screen/tab_bar_views/picture_of_the_day/widgets/picture.dart';

class PictureOfTheDayWM
    extends WidgetModel<PictureOfTheDayWidget, PictureOfTheDayModel>
    implements IPictureOfTheDayWM {

  @override
  ValueListenable<Picture> get picture => throw UnimplementedError();

  PictureOfTheDayWM(PictureOfTheDayModel model) : super(model);
}
