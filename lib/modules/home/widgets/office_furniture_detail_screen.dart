import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:office_furniture_store/core/extensions/widget.dart';
import 'package:office_furniture_store/core/values/app_colors.dart';
import 'package:office_furniture_store/core/values/app_style.dart';
import 'package:office_furniture_store/data/model/furniture.dart';
import 'package:office_furniture_store/global_widgets/color_picker.dart';
import 'package:office_furniture_store/global_widgets/counter_button.dart';
import 'package:office_furniture_store/global_widgets/rating_bar.dart';
import 'package:office_furniture_store/modules/home/home_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OfficeFurnitureDetailScreen extends GetView<HomeController> {
  final Furniture furniture;

  const OfficeFurnitureDetailScreen({
    super.key,
    required this.furniture,
  });

  Widget furnitureImageSlider(double height) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      height: height * 0.5,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            onPageChanged: controller.switchBetweenPageViewItems,
            itemCount: furniture.images.length,
            itemBuilder: (BuildContext context, int index) {
              return Hero(
                tag: furniture.title,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    furniture.images[index],
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            child: Obx(
              () {
                return AnimatedSmoothIndicator(
                  effect: const WormEffect(
                    dotColor: Colors.white38,
                    activeDotColor: Colors.white,
                  ),
                  count: furniture.images.length,
                  activeIndex: controller.currentPageViewItemIndicator.value,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () {
        controller.currentPageViewItemIndicator.value = 0;
        return Future.value(true);
      },
      child: Scaffold(
        appBar: _appBar(),
        bottomNavigationBar: bottomBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                furnitureImageSlider(height),
                Center(
                  child: StarRatingBar(
                    score: furniture.score,
                    itemSize: 25,
                  ).fadeAnimation(1.4),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: const Text(
                    "Synopsis",
                    style: h2Style,
                    textAlign: TextAlign.end,
                  ).fadeAnimation(0.6),
                ),
                Text(
                  furniture.description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black45),
                ).fadeAnimation(1.8),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      "Color :",
                      style: h2Style,
                      textAlign: TextAlign.end,
                    ),
                    Expanded(child: ColorPicker(furniture.colors)),
                    Expanded(
                      child: GetBuilder<HomeController>(
                        builder: (controller) {
                          return CounterButton(
                            label: furniture.quantity,
                            onIncrementSelected: () =>
                                controller.increaseItem(furniture),
                            onDecrementSelected: () =>
                                controller.decreaseItem(furniture),
                          );
                        },
                      ),
                    ),
                  ],
                ).fadeAnimation(2.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container bottomBar() {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FittedBox(
                child: Text(
                  'Price',
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              FittedBox(child: Text("\$${furniture.price}", style: h2Style))
            ],
          ),
          //  ElevatedButton 的默认行为是根据其内容来确定自己的宽度，
          //  以确保按钮完全包含其子部件。如果没有显式设置宽度约束，
          //  它将根据子部件的大小来决定自己的宽度。
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightBlack,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => controller.addToCart(furniture),
            child: const Text("Add to cart"),
          )
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(furniture.title, style: h2Style),
      actions: [
        GetBuilder<HomeController>(
          builder: (controller) {
            return IconButton(
              splashRadius: 18.0,
              onPressed: () => controller.isFavoriteFurniture(furniture),
              icon: furniture.isFavorite
                  ? const Icon(Icons.bookmark, color: Colors.black)
                  : const Icon(Icons.bookmark_border, color: Colors.black),
            );
          },
        )
      ],
      leading: IconButton(
        onPressed: () {
          controller.currentPageViewItemIndicator.value = 0;
          Get.back();
        },
        icon: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
      ),
    );
  }
}
