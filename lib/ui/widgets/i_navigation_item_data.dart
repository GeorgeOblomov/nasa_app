import 'package:flutter/material.dart';

/// Interface for receiving data for an object of type [BottomNavigationBarItem].
abstract class INavigationItemData {

  /// Gets [IconData] for [BottomNavigationBarItem].
  IconData getIcon();

  /// Gets [String] for [BottomNavigationBarItem].
  String getLabel();
}