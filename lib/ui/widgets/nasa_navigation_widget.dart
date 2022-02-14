import 'package:flutter/material.dart';
import 'package:nasa_app/ui/nasa_about_screen/nasa_about_screen.dart';
import 'package:nasa_app/ui/nasa_feed_screen/nasa_feed_screen.dart';

class NasaHomeScreen extends StatefulWidget {
  final screens = [
    const NasaFeedScreen(),
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
        items: [
          BottomNavigationBarItem(
            label: NasaFeedScreen.getTitle(context),
            icon: Icon(NasaFeedScreen.getIcon()),
          ),
          BottomNavigationBarItem(
            label: NasaAboutScreen.getTitle(context),
            icon: Icon(NasaAboutScreen.getIcon()),
          ),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: widget.screens.map((screen) => screen).toList(),
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
