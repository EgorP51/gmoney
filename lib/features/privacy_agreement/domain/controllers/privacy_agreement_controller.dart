import 'package:get/get.dart';

class PrivacyAgreementController extends GetxController {
  var enabled = false.obs;

  void toggleCheckbox() {
    if (enabled.value) {
      enabled.value = false;
    } else {
      enabled.value = true;
    }
  }
}
