import 'package:flutter/material.dart';
import 'package:nasa_app/ui/nasa_about_screen/nasa_about_screen.dart';
import 'package:nasa_app/ui/nasa_favorite_screen/nasa_favorite_screen.dart';
import 'package:nasa_app/ui/nasa_feed_screen/nasa_feed_screen.dart';
import 'package:nasa_app/ui/widgets/i_navigation_item_data.dart';

class NasaHomeScreen extends StatefulWidget {
  final screens = <INavigationItemData>[
    const NasaFeedScreen(),
    const NasaFavoriteScreen(),
    const NasaAboutScreen(),
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
        items: widget.screens.map((screen) {
          return BottomNavigationBarItem(
            icon: Icon(screen.getIcon()),
            label: screen.getLabel(context),
          );
        }).toList(),
      ),
      body: SafeArea(
        child: widget.screens.elementAt(_selectedIndex) as Widget,
      ),
    );
  }

  void _onTabSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
