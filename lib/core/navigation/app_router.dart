import 'package:get/get.dart';
import 'package:gmoney_app/features/authorization/presentation/screens/authorization_screen.dart';
import 'package:gmoney_app/features/initial_screen.dart';
import 'package:gmoney_app/features/password_recovery/presentation/screens/password_change_screen.dart';
import 'package:gmoney_app/features/password_recovery/presentation/screens/password_recovery_screen.dart';
import 'package:gmoney_app/features/privacy_agreement/presentation/privacy_agreement_screen.dart';
import 'package:gmoney_app/features/registration/bank_account/presentation/screens/bank_account_screen.dart';
import 'package:gmoney_app/features/registration/contact_Information/presentation/screens/contact_information_screen.dart';
import 'package:gmoney_app/features/registration/occupation_income/presentation/screens/occupation_income_screen.dart';
import 'package:gmoney_app/features/registration/personal_data/presentation/screens/personal_data_screen.dart';
import 'package:gmoney_app/features/registration/registration_address/presentation/screens/registration_address_screen.dart';
import 'package:gmoney_app/features/registration/sms_confirmation/presentation/screens/sms_confirmation_screen.dart';

class AppRouter {
  static const initialRoute = '/';
  static const authorization = '/authorization';
  static const passwordRecovery = '/password_recovery';
  static const passwordChange = '/password_change';
  static const privacyAgreement = '/privacy_agreement';
  static const contactInformation = '/contact_information';
  static const smsConfirmation = '/sms_confirmation';
  static const personalData = '/personal_data';
  static const occupationIncome = '/occupation_income';
  static const registrationAddress = '/registration_address';
  static const bankAccount = '/bankAccount';

  static List<GetPage> get pages => [
        GetPage(name: initialRoute, page: () => const InitialScreen()),
        GetPage(name: authorization, page: () => const AuthorizationScreen()),
        GetPage(
            name: passwordRecovery, page: () => const PasswordRecoveryScreen()),
        GetPage(name: passwordChange, page: () => const PasswordChangeScreen()),
        GetPage(name: privacyAgreement, page: () => PrivacyAgreementScreen()),
        GetPage(name: contactInformation, page: () => const ContactInformationScreen()),
        GetPage(name: smsConfirmation, page: () => const SmsConfirmationScreen()),
        GetPage(name: personalData, page: () => const PersonalDataScreen()),
        GetPage(name: occupationIncome, page: () => const OccupationIncomeScreen()),
        GetPage(name: registrationAddress, page: () => const RegistrationAddressScreen()),
        GetPage(name: bankAccount, page: () => const BankAccountScreen()),
      ];

  static void navigateToBankAccount() {
    Get.toNamed(bankAccount);
  }

  static void navigateToRegistrationAddress() {
    Get.toNamed(registrationAddress);
  }

  static void navigateToOccupationIncome() {
    Get.toNamed(occupationIncome);
  }

  static void navigateToPersonalData() {
    Get.toNamed(personalData);
  }

  static void navigateToSmsConfirmation() {
    Get.toNamed(smsConfirmation);
  }

  static void navigateToContactInformation() {
    Get.toNamed(contactInformation);
  }

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
