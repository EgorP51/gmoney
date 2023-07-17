import 'package:get/get.dart';
import 'package:gmoney_app/features/authorization/presentation/screens/authorization_screen/authorization_screen.dart';
import 'package:gmoney_app/features/initial_screen.dart';
import 'package:gmoney_app/features/password_recovery/presentation/password_change_screen.dart';
import 'package:gmoney_app/features/password_recovery/presentation/password_recovery_screen.dart';
import 'package:gmoney_app/features/privacy_agreement/presentation/privacy_agreement_screen.dart';

class AppRouter {
  static const initialRoute = '/';
  static const authorization = '/authorization';
  static const passwordRecovery = '/password_recovery';
  static const passwordChange = '/password_change';
  static const privacyAgreement = '/privacy_agreement';

  static List<GetPage> get pages => [
        GetPage(name: initialRoute, page: () => const InitialScreen()),
        GetPage(name: authorization, page: () => const AuthorizationScreen()),
        GetPage(
            name: passwordRecovery, page: () => const PasswordRecoveryScreen()),
        GetPage(name: passwordChange, page: () => const PasswordChangeScreen()),
        GetPage(name: privacyAgreement, page: () => PrivacyAgreementScreen()),
      ];

  static void navigateToAuthorization() {
    Get.offAllNamed(authorization);
  }

  static void navigateToPasswordRecovery() {
    Get.toNamed(passwordRecovery);
  }

  static void navigateToPasswordChange() {
    Get.toNamed(passwordChange);
  }

  static void navigateTopPrivacyAgreement() {
    Get.toNamed(privacyAgreement);
  }

  static void navigateBack() {
    Get.back();
  }
}
