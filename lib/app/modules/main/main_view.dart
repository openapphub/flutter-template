import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../infrastructure/navigation/navigation_controller.dart';
import '../../global_widgets/custom_bottom_nav_item.dart';
import '../home/home_view.dart';
import '../profile/profile_view.dart';
import '../settings/settings_view.dart';

class MainView extends StatelessWidget {
  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.selectedIndex.value,
            children: [
              HomeView(),
              ProfileView(),
              SettingsView(),
            ],
          ),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
                currentIndex: controller.selectedIndex.value,
                onTap: (index) {
                  controller.changePage(index);
                  controller.clearUnreadCount(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: CustomBottomNavItem(
                      icon: Icons.home,
                      label: 'Home',
                      unreadCount: controller.unreadCounts[0].value,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: CustomBottomNavItem(
                      icon: Icons.person,
                      label: 'Profile',
                      unreadCount: controller.unreadCounts[1].value,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: CustomBottomNavItem(
                      icon: Icons.settings,
                      label: 'Settings',
                      unreadCount: controller.unreadCounts[2].value,
                    ),
                    label: '',
                  ),
                ],
              )),
        );
      },
    );
  }
}
