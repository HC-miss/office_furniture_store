import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_furniture_store/core/values/app_style.dart';
import 'package:office_furniture_store/global_widgets/empty_widget.dart';
import 'package:office_furniture_store/global_widgets/furniture_list_view.dart';
import 'package:office_furniture_store/modules/home/home_controller.dart';

class FavoriteScreen extends GetView<HomeController> {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites", style: h2Style)),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.favoriteFurnitureList.isNotEmpty
                  ? FurnitureListView(
                      isHorizontal: false,
                      furnitureList: controller.favoriteFurnitureList,
                    )
                  : const EmptyWidget(
                      type: EmptyWidgetType.favorite,
                      title: "Empty",
                    )
            ],
          ),
        ),
      ),
    );
  }
}
