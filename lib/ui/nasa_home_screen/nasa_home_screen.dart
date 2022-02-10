import 'package:flutter/material.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/i_navigation_bar_data.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_about_page/nasa_about_page.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_info_page/nasa_info_page.dart';

class NasaHomeScreen extends StatefulWidget {
  final pages = <INavigationBarItem>[
    const NasaInfoPage(),
    const NasaAboutPage(),
  ];

  NasaHomeScreen({Key? key}) : super(key: key);

  @override
  _NasaHomeScreenState createState() => _NasaHomeScreenState();
}

class _NasaHomeScreenState extends State<NasaHomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[400],
        onTap: _onTabSelect,
        items: widget.pages.map((page) {
          return BottomNavigationBarItem(
            label: page.getTitle(), icon: Icon(page.getIcon(),),);
        }).toList(),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: widget.pages.map((page) => page as Widget).toList(),
        ),
      ),
    );
  }

  void _onTabSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
