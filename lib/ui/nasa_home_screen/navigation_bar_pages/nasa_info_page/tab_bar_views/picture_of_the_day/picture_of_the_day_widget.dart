import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/services/models/picture.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_info_page/tab_bar_views/picture_of_the_day/i_picture_of_the_day_model.dart';
import 'package:nasa_app/ui/widgets/network_image_widget.dart';
import 'package:nasa_app/utils/app_colors.dart';
import 'package:nasa_app/utils/app_text_styles.dart';
import 'package:nasa_app/utils/const.dart';

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

    const randomButtonPadding = EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 16,
    );
    const randomButtonMargin = EdgeInsets.symmetric(vertical: 24);

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
                          Expanded(child: NetworkImageWidget(url: data.hdUrl ?? '', isTest: isTest)),
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
