import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

class ForegroundController extends GetxController {
  var isValidation = false.obs;
  RxBool isKeyboardVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    KeyboardVisibilityController().onChange.listen((bool visible) {
      isKeyboardVisible.value = visible;
    });
  }

  void toggleForeground() async {
    isValidation.value = true;
  }
}
