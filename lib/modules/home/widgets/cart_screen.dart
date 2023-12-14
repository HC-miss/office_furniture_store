import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_furniture_store/core/values/app_colors.dart';
import 'package:office_furniture_store/core/values/app_style.dart';
import 'package:office_furniture_store/global_widgets/bottom_bar.dart';
import 'package:office_furniture_store/global_widgets/cart_list_view.dart';
import 'package:office_furniture_store/global_widgets/counter_button.dart';
import 'package:office_furniture_store/global_widgets/empty_widget.dart';
import 'package:office_furniture_store/modules/home/home_controller.dart';

class CartScreen extends GetView<HomeController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: Obx(
        () {
          return BottomBar(
            priceLabel: "Total price",
            priceValue: "\$${controller.totalPrice.value.toStringAsFixed(2)}",
            buttonLabel: "Checkout",
            onTap: controller.totalPrice > 0 ? () {} : null,
          );
        },
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          if (controller.cartFurniture.isNotEmpty) {
            return CartListView(
              furnitureItems: controller.cartFurniture,
              counterButton: (furniture) {
                return CounterButton(
                  orientation: Axis.vertical,
                  onIncrementSelected: () => controller.increaseItem(furniture),
                  onDecrementSelected: () => controller.decreaseItem(furniture),
                  label: furniture.quantity,
                );
              },
            );
          }
          return EmptyWidget(title: "Empty");
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Cart", style: h2Style),
      actions: [
        IconButton(
          splashRadius: 20.0,
          onPressed: controller.clearCart,
          icon: const Icon(Icons.delete, color: AppColors.lightBlack),
        )
      ],
    );
  }
}
