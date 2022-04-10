import 'package:d2yrestaurant/screens/home_screen.dart';
import 'package:d2yrestaurant/screens/search_screen.dart';
import 'package:d2yrestaurant/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  static const routeName = '/layout_screen';

  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _bottomNavIndex = 0;
  static const String _homeText = 'Home';

  final List<Widget> _listScreen = const [
    HomeScreen(),
    SearchScreen(),
    SettingsScreen(),
  ];

  final List<BottomNavigationBarItem> _bottomNavItem = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      label: _homeText,
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      label: SearchScreen.searchText,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: SettingsScreen.settingsText,
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listScreen[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavItem,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
