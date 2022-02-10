import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/ui/nasa_home_screen/tab_bar_views/picture_of_the_day/i_picture_of_the_day_model.dart';

class PictureOfTheDayWidget extends ElementaryWidget<IPictureOfTheDayWM> {
  const PictureOfTheDayWidget({
    Key? key,
    WidgetModelFactory wmFactory = createPictureOfTheDayWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IWidgetModel wm) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      ),
    );
  }
}
