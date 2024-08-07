import 'package:flutter/material.dart';
import 'package:flutter_template/app/modules/home/views/home_view.dart';
import 'package:flutter_template/app/modules/profile/views/profile_view.dart';
import 'package:flutter_template/app/modules/settings/views/settings_view.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return PersistentTabView(
      context,
      controller: controller.tabController,
      screens: const [
        HomeView(),
        SettingsView(),
        ProfileView(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: colorScheme.onTertiary,
          inactiveColorPrimary: colorScheme.onTertiary,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.search),
          title: ("Search"),
          activeColorPrimary: colorScheme.onTertiary,
          inactiveColorPrimary: colorScheme.onTertiary,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          title: ("Profile"),
          activeColorPrimary: colorScheme.onTertiary,
          inactiveColorPrimary: colorScheme.onTertiary,
        ),
      ],
      padding: const EdgeInsets.only(top: 8),
      confineToSafeArea: true,
      backgroundColor: colorScheme.primary,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarStyle: NavBarStyle.style19,
    );
  }
}
