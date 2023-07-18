import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmsConfirmationController extends GetxController {
  final RxString currentText = ''.obs;
  final TextEditingController textEditingController = TextEditingController();

  void onChanged(String value) {
    currentText.value = value;
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  void checkCode(String? value){
    //TODO: change when there will be a service to check the phone number
    String? expectedValue = '123456';
    if(expectedValue == value){
      // here navigation
      Get.snackbar('код совпадает', 'прям сильно совпадает');
    }
  }
}
