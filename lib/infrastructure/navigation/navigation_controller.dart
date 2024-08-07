import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;
  var unreadCounts = [0.obs, 0.obs, 0.obs];

  void changePage(int index) {
    selectedIndex.value = index;
    update();
  }

  void incrementUnreadCount(int pageIndex) {
    unreadCounts[pageIndex]++;
  }

  void clearUnreadCount(int pageIndex) {
    unreadCounts[pageIndex].value = 0;
  }
}
