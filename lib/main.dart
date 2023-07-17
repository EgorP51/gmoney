import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gmoney_app/core/ui/theme/gmoney_colors.dart';
import 'package:gmoney_app/features/authorization/presentation/screens/authorization_screen/authorization_screen.dart';
import 'package:gmoney_app/features/authorization/presentation/screens/authorization_screen/input_widget.dart';
import 'package:gmoney_app/features/initial_screen.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

import 'core/navigation/app_router.dart';
import 'core/utils/app_size.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //TODO: спросить что тут делать!
    statusBarColor: Color(0xFF1E2028),
    systemNavigationBarColor: Color(0xFF1E2028),
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRouter.initialRoute,
      getPages: AppRouter.pages,
      home: const InitialScreen(), /*PixelPerfect(
        assetPath: 'assets/dev/Авторизация.png',
        scale: 1,
        initBottom: 20,
        offset: Offset.zero,
        initOpacity: 0.4,
        child: const AuthorizationScreen(),
      ),*/
    );
  }
}
