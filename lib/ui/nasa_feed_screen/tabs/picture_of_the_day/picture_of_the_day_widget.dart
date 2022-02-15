import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/services/models/picture.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/picture_of_the_day/i_picture_of_the_day_wm.dart';
import 'package:nasa_app/ui/widgets/button_widget.dart';
import 'package:nasa_app/ui/widgets/network_image_widget.dart';
import 'package:nasa_app/utils/app_colors.dart';
import 'package:nasa_app/utils/app_text_styles.dart';

class PictureOfTheDayWidget extends ElementaryWidget<IPictureOfTheDayWM> {
  final bool isTest;

  const PictureOfTheDayWidget({
    Key? key,
    WidgetModelFactory wmFactory = createPictureOfTheDayWM,
    this.isTest = false,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPictureOfTheDayWM wm) {
    const commonPadding = EdgeInsets.symmetric(horizontal: 16);

    const picturePadding = EdgeInsets.symmetric(horizontal: 8);

    return ValueListenableBuilder<Picture?>(
      valueListenable: wm.picture,
      builder: (_, data, __) {
        return data == null
            ? const Center(child: CircularProgressIndicator())
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
                          Expanded(
                            child: Container(
                              padding: picturePadding,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: imageBackground,
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: NetworkImageWidget(
                                url: data.hdUrl ?? '',
                                isTest: isTest,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ButtonWidget(
                      title: randomButtonTitle,
                      onTap: wm.onRandomButtonTap,
                    ),
                  ],
                ),
              );
      },
    );
  }
}
