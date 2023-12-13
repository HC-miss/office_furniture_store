import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:office_furniture_store/core/theme/app_theme.dart';
import 'package:office_furniture_store/routes/app_pages.dart';

Future<void> main() async {
  // await Global.init();
  // 显示布局信息
  debugPaintSizeEnabled = false;
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'OfficeFurnitureStore',

      initialRoute: AppPages.initial,
      getPages: AppPages.routes,

      theme: AppTheme.lightTheme,
      // 国际化支持-代理
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      // locale: Locale('zh', 'cn'),
    );
  }
}
