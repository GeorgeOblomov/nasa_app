import 'package:cached_network_image/cached_network_image.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/services/models/picture.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_info_page/tab_bar_views/picture_of_the_day/i_picture_of_the_day_model.dart';

class PictureOfTheDayWidget extends ElementaryWidget<IPictureOfTheDayWM> {
  const PictureOfTheDayWidget({
    Key? key,
    WidgetModelFactory wmFactory = createPictureOfTheDayWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPictureOfTheDayWM wm) {
    return ValueListenableBuilder<Picture?>(
      valueListenable: wm.picture,
      builder: (_, data, __) {
        return data == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(data.title),
                  if (wm.hasImage())
                    CachedNetworkImage(
                      imageUrl: data.hdUrl!,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      fit: BoxFit.cover,
                    ),
                ],
              );
      },
    );
  }
}
