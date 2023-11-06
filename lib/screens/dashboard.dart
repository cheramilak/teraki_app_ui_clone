import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:teraki_app_ui/screens/home.dart';

import '../utils/SHBottomNavbarWidget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 1;
  List<Widget> dashBoardScreenList = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(
      white,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dashBoardScreenList[_currentIndex],
      bottomNavigationBar: SHBottomNavbarWidget(
        selectedIndex: _currentIndex,
        backgroundColor: Color.fromARGB(77, 190, 188, 188),
        showElevation: true,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
        },
        items: [
          BottomNavyBarItem(
              icon: Icon(Icons.library_books),
              title: Text('Library',
                  style: boldTextStyle(color: Colors.white, size: 14))),
          BottomNavyBarItem(
              icon: Icon(Icons.headphones),
              title: Text('Audiobooks',
                  style: boldTextStyle(color: Colors.white, size: 14))),
          BottomNavyBarItem(
              icon: Icon(Icons.category),
              title: Text('Categorys',
                  style: boldTextStyle(color: Colors.white, size: 14))),
          BottomNavyBarItem(
              icon: Icon(Icons.mic),
              title: Text('Podcasts',
                  style: boldTextStyle(color: Colors.white, size: 14))),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('settings',
                  style: boldTextStyle(color: Colors.white, size: 14))),
        ],
      ).paddingTop(12),
    );
  }
}
