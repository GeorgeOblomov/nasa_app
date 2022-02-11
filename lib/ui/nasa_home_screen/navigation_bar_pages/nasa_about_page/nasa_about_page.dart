import 'package:flutter/material.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/i_navigation_bar_data.dart';
import 'package:nasa_app/utils/app_text_styles.dart';
import 'package:nasa_app/utils/const.dart';

class NasaAboutPage extends StatelessWidget implements INavigationBarItem {

  const NasaAboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 200),
            const SizedBox(height: 50),
            Text(appDescription, style: AppTextStyles.description),
          ],
        ),
      ),
    );
  }

   @override
  String getTitle() => aboutPageTitle;

  @override
  IconData getIcon() => Icons.account_circle;
}
