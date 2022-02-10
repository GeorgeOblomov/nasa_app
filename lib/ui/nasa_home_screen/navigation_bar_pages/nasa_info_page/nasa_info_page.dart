import 'package:flutter/material.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/i_navigation_bar_data.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_info_page/tab_bar_views/mars_photos/mars_photos_widget.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_info_page/tab_bar_views/picture_of_the_day/picture_of_the_day_widget.dart';
import 'package:nasa_app/utils/app_colors.dart';
import 'package:nasa_app/utils/app_text_styles.dart';
import 'package:nasa_app/utils/const.dart';

class NasaInfoPage extends StatelessWidget implements INavigationBarItem {
  const NasaInfoPage({Key? key}) : super(key: key);

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
              tabs: const [
                Padding(
                  padding: tabPadding,
                  child: Tab(
                    text: pictureOfTheDayTitle,
                  ),
                ),
                Padding(
                  padding: tabPadding,
                  child: Tab(
                    text: weatherOnMarsTitle,
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
  String getTitle() => infoPageTitle;

  @override
  IconData getIcon() => Icons.info_outline;
}
