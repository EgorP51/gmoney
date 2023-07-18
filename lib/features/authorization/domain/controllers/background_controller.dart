import 'package:get/get.dart';

class BackgroundController extends GetxController {
  var isValidation = false.obs;

  void toggleBackground() {
    isValidation.value = true;
  }
}
