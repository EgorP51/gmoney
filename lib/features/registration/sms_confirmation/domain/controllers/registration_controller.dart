import 'dart:async';

import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final RxInt countdown = 59.obs;
  final RxBool timerRunning = false.obs;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    if (!timerRunning.value) {
      timerRunning.value = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        if (countdown.value > 0) {
          countdown.value--;
        } else {
          timerRunning.value = false;
          _timer.cancel();
        }
      });
    }
  }

  void resendCode() {
    if (!timerRunning.value) {
      countdown.value = 59;
      startTimer();
    }
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
