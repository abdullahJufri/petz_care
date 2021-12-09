import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:petz_care/theme.dart';
import 'package:petz_care/ui/favorite_page.dart';
import 'package:petz_care/ui/home_page.dart';
import 'package:petz_care/ui/profile_page.dart';
import 'package:petz_care/ui/search_page.dart';
import 'package:petz_care/widget/platform_widget.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _bottomNavIndex = 0;

  final List<Widget> _listWidget = [
    HomePage(),
    const SearchPage(),
    const FavoritePage(),
    const MyProfile(),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  final _items = <Widget>[
    const Icon(
      Icons.home_rounded,
      size: 30,
    ),
    const Icon(
      Icons.search,
      size: 30,
    ),
    const Icon(
      Icons.favorite_rounded,
      size: 30,
    ),
    const Icon(
      Icons.person,
      size: 30,
    ),
  ];

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: whiteColor),
        ),
        child: CurvedNavigationBar(
          color: blackColor,
          buttonBackgroundColor: blackColor,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 400),
          height: 60,
          items: _items,
          index: _bottomNavIndex,
          onTap: _onBottomNavTapped,
        ),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return Container(
      color: blackColor,
      child: SafeArea(
        top: false,
        child: ClipRRect(
          child: Scaffold(
            extendBody: true,
            body: _listWidget[_bottomNavIndex],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: const IconThemeData(color: whiteColor),
              ),
              child: CurvedNavigationBar(
                color: blackColor,
                buttonBackgroundColor: whiteColor,
                backgroundColor: Colors.transparent,
                animationCurve: Curves.easeInOutCirc,
                animationDuration: const Duration(milliseconds: 200),
                height: 60,
                items: _items,
                index: _bottomNavIndex,
                onTap: _onBottomNavTapped,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _notificationHelper
  //       .configureSelectNotificationSubject(RestaurantDetailPage.routeName);
  // }

}
