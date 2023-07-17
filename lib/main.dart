import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gmoney_app/core/navigation/app_router.dart';
import 'package:gmoney_app/features/authorization/domain/controllers/login_controller.dart';
import 'package:gmoney_app/features/initial_screen.dart';

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
      home: const InitialScreen(),
    );
  }
}
