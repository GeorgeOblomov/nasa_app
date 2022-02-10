import 'package:flutter/material.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/i_navigation_bar_data.dart';
import 'package:nasa_app/utils/const.dart';

class NasaAboutPage extends StatelessWidget implements INavigationBarItem {

  const NasaAboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.blue,
    );
  }

   @override
  String getTitle() => aboutPageTitle;

  @override
  IconData getIcon() => Icons.account_circle;
}
