import 'package:flutter/material.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/i_navigation_bar_data.dart';
import 'package:nasa_app/ui/nasa_home_screen/tab_bar_views/picture_of_the_day/picture_of_the_day_widget.dart';
import 'package:nasa_app/utils/colors.dart';
import 'package:nasa_app/utils/const.dart';

class NasaInfoPage extends StatelessWidget implements INavigationBarItem {
  const NasaInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const selectedLabelStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    const unselectedLabelStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

    const labelPadding = EdgeInsets.all(8);
    const tabPadding = EdgeInsets.symmetric(horizontal: 16);

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            labelStyle: selectedLabelStyle,
            unselectedLabelStyle: unselectedLabelStyle,
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
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              children: [
                const PictureOfTheDayWidget(),
                Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                ),
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
