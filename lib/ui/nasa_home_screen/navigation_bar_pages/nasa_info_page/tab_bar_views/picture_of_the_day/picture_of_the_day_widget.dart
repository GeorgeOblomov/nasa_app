import 'package:cached_network_image/cached_network_image.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/services/models/picture.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_info_page/tab_bar_views/picture_of_the_day/i_picture_of_the_day_model.dart';
import 'package:nasa_app/utils/app_colors.dart';
import 'package:nasa_app/utils/app_text_styles.dart';
import 'package:nasa_app/utils/const.dart';

class PictureOfTheDayWidget extends ElementaryWidget<IPictureOfTheDayWM> {
  const PictureOfTheDayWidget({
    Key? key,
    WidgetModelFactory wmFactory = createPictureOfTheDayWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPictureOfTheDayWM wm) {
    const progressIndicator = Center(child: CircularProgressIndicator());

    const commonPadding = EdgeInsets.symmetric(horizontal: 16);

    const randomButtonPadding = EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 16,
    );
    const randomButtonMargin = EdgeInsets.only(bottom: 24);

    return ValueListenableBuilder<Picture?>(
      valueListenable: wm.picture,
      builder: (_, data, __) {
        return data == null
            ? progressIndicator
            : Padding(
                padding: commonPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            data.title,
                            style: AppTextStyles.title,
                          ),
                          const SizedBox(height: 8),
                            CachedNetworkImage(
                              imageUrl:  data.hdUrl ?? '',
                              placeholder: (context, url) => progressIndicator,
                              // ignore: implicit_dynamic_parameter
                              errorWidget: (context, url, error) => Column(
                                children: const [
                                  Icon(Icons.error, color: Colors.red,),
                                  SizedBox(height: 8),
                                  Text('Oops, something go wrong!'),
                                ],
                              ),
                              fit: BoxFit.cover,
                            ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: wm.onRandomTap,
                      child: Container(
                        margin: randomButtonMargin,
                        padding: randomButtonPadding,
                        child: Text(
                          randomButtonTitle,
                          style: AppTextStyles.randomButton,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: tabItemGradientColors,
                            stops: const [0.5, 1.0],
                            begin: FractionalOffset.topLeft,
                            end: FractionalOffset.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
