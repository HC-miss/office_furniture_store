import 'package:get/get.dart';
import 'package:office_furniture_store/modules/home/home_binding.dart';
import 'package:office_furniture_store/modules/home/home_page.dart';
// import 'package:office_furniture_store/modules/intro/intro_binding.dart';
import 'package:office_furniture_store/modules/intro/intro_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const initial = AppRoutes.introPage;

  static final routes = [
    // intro
    GetPage(
      name: AppRoutes.introPage,
      page: () => const IntroPage(),
      // binding: IntroBinding(),
    ),
    // intro
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
      binding: HomeBinding(),
    )
  ];
}
