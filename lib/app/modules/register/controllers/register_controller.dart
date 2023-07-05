import 'dart:developer';

import 'package:catatan/app/modules/register/providers/register_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterRepository _apiProvider = RegisterRepository();

  final email = TextEditingController();
  final password = TextEditingController();
  final isValid = false.obs;

  validForm() {
    isValid(email.text.isNotEmpty && password.text.isNotEmpty);
  }

  register() async {
    await _apiProvider
        .register(email: email.text, password: password.text)
        .then((value) {
      if (value) {
        log('Berhasil register');
        // Get.toNamed(Routes.L);
        Get.back();
      } else {
        log('Gagal Login');
      }
    });
  }

  @override
  void onInit() {
    email.addListener(() {
      validForm();
    });
    password.addListener(() {
      validForm();
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
