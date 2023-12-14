import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_furniture_store/core/values/app_data.dart';
import 'package:office_furniture_store/core/values/app_style.dart';
import 'package:office_furniture_store/data/model/furniture.dart';
import 'package:office_furniture_store/global_widgets/furniture_list_view.dart';
import 'package:office_furniture_store/modules/home/widgets/office_furniture_detail_screen.dart';

class OfficeFurnitureListScreen extends StatelessWidget {
  const OfficeFurnitureListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<Widget?> navigate(Furniture furniture) {
      return Get.to<Widget>(
        () => OfficeFurnitureDetailScreen(
          furniture: furniture,
        ),
        duration: const Duration(seconds: 1),
      )!;
      // 使用元素路由 在页面返回时没有hero动画
      // return Navigator.push(
      //   context,
      //   PageRouteBuilder(
      //     transitionDuration: const Duration(seconds: 1),
      //     pageBuilder: (_, __, ___) => OfficeFurnitureDetailScreen(
      //       furniture: furniture,
      //     ),
      //   ),
      // );
    }

    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            _searchBar(),
            FurnitureListView(
              furnitureList: AppData.furnitureList,
              onTap: navigate,
            ),
            const Text("Popular", style: h2Style),
            FurnitureListView(
              furnitureList: AppData.furnitureList,
              isHorizontal: false,
              onTap: navigate,
            ),
          ],
        ),
      ),
    );
  }

  Padding _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: const Icon(Icons.menu, color: Colors.grey),
          contentPadding: const EdgeInsets.all(20),
          border: textFieldStyle,
          focusedBorder: textFieldStyle,
        ),
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello Sina", style: h2Style),
                  Text("Buy Your favorite desk", style: h3Style),
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
            ],
          ),
        ),
      ),
    );
  }
}
