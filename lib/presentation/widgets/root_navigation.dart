import 'package:flutter/material.dart';
import 'package:news_app/presentation/general_widgets/custom_bottom_nav_bar.dart';
import 'package:news_app/presentation/pages/favorite_page/favorite.dart';
import 'package:news_app/presentation/pages/home_page/home.dart';
import 'package:news_app/presentation/pages/profile/profie.dart';
import 'package:news_app/resources/resources.dart';
import 'package:news_app/styles/styles.dart';

class RootNavigation extends StatefulWidget {
  const RootNavigation({Key? key}) : super(key: key);

  @override
  _RootNavigationState createState() => _RootNavigationState();
}

class _RootNavigationState extends State<RootNavigation> {
  int _selectedTab = 0;

  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: IndexedStack(
            index: _selectedTab,
            children: [
              Home(),
              Favorite(),
              Profile(),
            ],
          ), //index there
        ),
        Positioned(
          bottom: 40,
          left: 28,
          right: 28,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Material(
              child: CustomBottomNavBar(
                currentIndex: _selectedTab,
                iconSize: 24,
                selectedColor: ConstantsColor.kPrimary,
                unselectedColor: Colors.grey,
                backgroundColor: Colors.white,
                items: [
                  BottomBarItem(icon:Icons.home, label: 'Home'),
                  BottomBarItem(icon: Icons.favorite, label: 'Favorite'),
                  BottomBarItem(icon: Icons.person, label: 'Profile'),
                ],
                onTabSelected: onSelectedTab,
                height: 66,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
