import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegistrationAddressController extends GetxController {
  final addressFormKey = GlobalKey<FormState>();

  final regionController = TextEditingController();
  final localityController = TextEditingController();
  final streetController = TextEditingController();
  final houseController = TextEditingController();
  final apartmentController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  final kinshipController = TextEditingController();

  var isRegionEmpty = false.obs;
  var isLocalityEmpty = false.obs;
  var isStreetEmpty = false.obs;
  var isHouseEmpty = false.obs;
  var isApartmentEmpty = false.obs;
  var isNameEmpty = false.obs;
  var isSurnameEmpty = false.obs;
  var isPhoneEmpty = false.obs;
  var isKinshipEmpty = false.obs;

  String? regionValidator(String? value) {
    //list from backend
    const items = [
      'Акмолинская область',
      'Актюбинская область',
      'Алматинская область',
      'Атырауская область',
      'Карагандинская область',
      'Костанайская область',
      'Мангистауская область',
      'Павлодарская область',
      'Туркестанская область'
    ];

    if (value == null || value.isEmpty) {
      return null;
    }

    if (!items.contains(value)) {
      return 'Выберите элемент из списка';
    }

    return null;
  }

  String? kinshipValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    const items = [
      'Домашний',
      'Родственник',
      'Друг / Подруга',
    ];

    if (!items.contains(value)) {
      return 'Выберите значение из списка';
    }

    return null;
  }

  String? localityValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    RegExp regExp = RegExp(r'^[а-яА-ЯёЁ]+$');
    if (!regExp.hasMatch(value)) {
      return 'Поле может содержать только символы кириллицы';
    }

    return null;
  }

  String? streetValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    RegExp regExp = RegExp(r'^[а-яА-ЯёЁ0-9]+$');
    if (!regExp.hasMatch(value)) {
      return 'Поле может содержать только символы кириллицы и цифры';
    }

    return null;
  }

  String? houseValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    RegExp regExp = RegExp(r'^[0-9/]+$');
    if (!regExp.hasMatch(value)) {
      return 'Поле может содержать только символы кириллицы и цифры';
    }

    RegExp digitRegExp = RegExp(r'^\d{1,5}$');
    if (!digitRegExp.hasMatch(value.replaceAll('/', ''))) {
      return 'Количество цифр должно быть от 1 до 5';
    }

    return null;
  }

  String? apartmentValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    RegExp regExp = RegExp(r'^\d+$');
    if (!regExp.hasMatch(value)) {
      return 'Поле может содержать только цифры';
    }

    if (value.length < 1 || value.length > 5) {
      return 'Количество цифр должно быть от 1 до 5';
    }
    return null;
  }

  String? surnameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    RegExp regExp = RegExp(r'^[а-яА-ЯёЁa-zA-Z]+$');
    if (!regExp.hasMatch(value)) {
      return 'Поле может содержать только буквы кириллицы или латиницы';
    }

    return null;
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    RegExp regExp = RegExp(r'^[а-яА-ЯёЁa-zA-Z]+$');
    if (!regExp.hasMatch(value)) {
      return 'Поле может содержать только буквы кириллицы или латиницы';
    }

    return null;
  }

  String? phoneNumberValidator(String? value) {
    bool allFieldsEmpty = (surnameController.text.isEmpty ||
        nameController.text.isEmpty ||
        localityController.text.isEmpty ||
        streetController.text.isEmpty ||
        houseController.text.isEmpty ||
        apartmentController.text.isEmpty ||
        kinshipController.text.isEmpty ||
        phoneController.text.isEmpty ||
        regionController.text.isEmpty);

    if (allFieldsEmpty) {
      isSurnameEmpty.value = true;
      isNameEmpty.value = true;
      isLocalityEmpty.value = true;
      isStreetEmpty.value = true;
      isHouseEmpty.value = true;
      isApartmentEmpty.value = true;
      isKinshipEmpty.value = true;
      isPhoneEmpty.value = true;
      isRegionEmpty.value = true;

      return 'Данные поля являются обязательными для заполнения';
    }

    if (value == null || value.isEmpty) {
      return null;
    }

    RegExp regExp = RegExp(r'^\d+$');
    if (!regExp.hasMatch(value)) {
      return 'Поле должно состоять из цифр и содержать 10 цифр';
    }

    if (value.length != 10) {
      return 'Поле должно содержать 10 цифр';
    }

    if (!value.startsWith('7')) {
      return 'Номер телефона должен начинаться с +7';
    }

    return null;
  }

  void toNextStep() {
    if (addressFormKey.currentState == null) {
      Get.snackbar('loginFormKey.currentState == null', "lkjhgbnk");
    }

    final isValid = addressFormKey.currentState!.validate();

    if (isValid) {
      // code for next step
    } else {
      Get.snackbar('Форма не прошла', 'Не соврал');
    }
    addressFormKey.currentState!.save();
  }
}
