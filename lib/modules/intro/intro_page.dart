import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_furniture_store/core/values/app_style.dart';
import 'package:office_furniture_store/routes/app_pages.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  Widget introButton() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.white.withOpacity(0.4),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.all(8.0),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
        onPressed: () {
          Get.toNamed(AppRoutes.homePage);
        },
        icon: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.2),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        label: Text(
          "Get started",
          style: h3Style.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/intro.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(flex: 3),
                Text(
                  "Kana Office\nStanding\nDesk",
                  style: h1Style.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  "Create a sustainable work space with 100% natural bamboo",
                  style: h3Style.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 20),
                introButton(),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
