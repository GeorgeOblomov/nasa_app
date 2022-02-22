import 'package:flutter/material.dart';
import 'package:nasa_app/generated/l10n.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/mars_photos/mars_photos_widget.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/picture_of_the_day/picture_of_the_day_widget.dart';
import 'package:nasa_app/ui/widgets/i_navigation_item_data.dart';
import 'package:nasa_app/utils/app_colors.dart';
import 'package:nasa_app/utils/app_text_styles.dart';

class NasaFeedScreen extends StatelessWidget implements INavigationItemData {
  const NasaFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const labelPadding = EdgeInsets.zero;
    const tabPadding = EdgeInsets.symmetric(horizontal: 16);

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const SizedBox(height: 24),
          Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: TabBar(
              isScrollable: true,
              labelColor: Colors.white,
              labelStyle: AppTextStyles.tabLabel,
              unselectedLabelStyle: AppTextStyles.tabLabel,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                gradient: LinearGradient(
                  colors: tabItemGradientColors,
                  stops: const [0.5, 1.0],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              enableFeedback: true,
              labelPadding: labelPadding,
              tabs: [
                Padding(
                  padding: tabPadding,
                  child: Tab(
                    text: S.current.pictureOfTheDayTitle,
                  ),
                ),
                Padding(
                  padding: tabPadding,
                  child: Tab(
                    text: S.current.photosFromMarsTitle,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Expanded(
            child: TabBarView(
              children: [
                PictureOfTheDayWidget(),
                MarsPhotosWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  String getLabel() => S.current.feedScreenTitle;

  @override
  IconData getIcon() => Icons.info_outline;
}
