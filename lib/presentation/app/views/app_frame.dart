import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../features/personal/personal.dart';
import '../../features/search/search.dart';
import '../../features/home/home.dart';
import '../models/app_tab.dart';

class AppFrame extends StatefulWidget {
  const AppFrame({super.key});

  @override
  State<AppFrame> createState() => _AppFrameState();
}

class _AppFrameState extends State<AppFrame> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  final _appTabList = AppTab.values;

  List<Widget> get _pages => _appTabList.map((tab) {
        switch (tab) {
          case AppTab.home:
            return const HomePage();
          case AppTab.search:
            return const SearchPage();
          case AppTab.personal:
            return const PersonalPage();
        }
      }).toList();

  List<PersistentBottomNavBarItem> _bottomBarItems(BuildContext context) =>
      _appTabList.map((tab) {
        final theme = Theme.of(context);
        return PersistentBottomNavBarItem(
          icon: Icon(tab.icon),
          title: tab.title.padRight(9, ' '),
          contentPadding: 0,
          iconSize: 24,
          activeColorPrimary: theme.secondaryHeaderColor,
          activeColorSecondary: theme.primaryColor,
          inactiveColorPrimary: theme.dividerColor,
          textStyle: theme.textTheme.titleMedium?.copyWith(
            color: Colors.black,
          ),
        );
      }).toList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _pages,
        navBarHeight: kBottomNavigationBarHeight,
        items: _bottomBarItems(context),
        confineInSafeArea: true,
        backgroundColor: theme.colorScheme.surface, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        padding: const NavBarPadding.all(0),
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style7, // Choose the nav bar style with this property.
        onItemSelected: (value) {},
      ),
    );
  }
}
