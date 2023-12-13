import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_furniture_store/core/values/app_colors.dart';
import 'package:office_furniture_store/core/values/app_data.dart';
import 'package:office_furniture_store/modules/home/home_controller.dart';

import 'widgets/cart_screen.dart';
import 'widgets/favorite_screen.dart';
import 'widgets/office_furniture_list_screen.dart';
import 'widgets/profile_screen.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  final List<Widget> screens = const [
    OfficeFurnitureListScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.currentBottomNavItemIndex.value,
          selectedItemColor: AppColors.lightBlack,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: controller.switchBetweenBottomNavigationItems,
          items: AppData.bottomNavigationItems.map(
                (element) {
              return BottomNavigationBarItem(
                icon: element.icon,
                label: element.label,
              );
            },
          ).toList(),
        );
      }),
      body: Obx(() {
        return screens[controller.currentBottomNavItemIndex.value];
      }),
    );
  }
}
