import 'package:bank_app/pages/splash.page.dart';
import 'package:bank_app/service_locator.dart';
import 'package:bank_app/utils/theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(DevicePreview(
    builder: (context) => const MyApp(),
    enabled: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      builder: () => GetMaterialApp(
        title: 'Calendário',
        debugShowCheckedModeBanner: false,
        theme: themeData(),
        home: const SplashPage(),
      ),
    );
  }
}
