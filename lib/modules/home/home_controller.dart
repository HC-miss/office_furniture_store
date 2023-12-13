import 'package:get/get.dart';


class HomeController extends GetxController {
  RxInt currentBottomNavItemIndex = 0.obs;
  // 当前页面查看项目指示器
  RxInt currentPageViewItemIndicator = 0.obs;


  void switchBetweenBottomNavigationItems(int currentIndex) {
    currentBottomNavItemIndex.value = currentIndex;
  }
}
