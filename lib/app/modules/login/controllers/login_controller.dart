// import 'dart:math';

import 'dart:developer';

import 'package:catatan/app/modules/login/providers/login_repository.dart';
import 'package:catatan/app/routes/app_pages.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  LoginRepository _apiProvider = LoginRepository();

  final LocalAuthentication auth = LocalAuthentication();

  final email = TextEditingController();
  final password = TextEditingController();
  final isValid = false.obs;

  validForm() {
    isValid(email.text.isNotEmpty && password.text.isNotEmpty);
  }

  login() async {
    EasyLoading.show(status: 'Memuat...');
    await _apiProvider
        .login(email: email.text, password: password.text)
        .then((value) {
      EasyLoading.dismiss();
      if (value) {
        log('Berhasil Login');
        Get.toNamed(Routes.HOME);
      } else {
        EasyLoading.showError('username/password salah');
        log('Gagal Login');
      }
    });
  }
//setup finger

  void _auth() async {
    log('_auth');
    EasyLoading.show(status: 'Memuat...');
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    log('available biometrics : ${availableBiometrics.length}');
    print(availableBiometrics);

    EasyLoading.dismiss();
    if (availableBiometrics.contains(BiometricType.fingerprint)) {
      print("Finger");
      _startBioMetricAuth("Gunakan Fingerprint untuk melakukan autentikasi.");
    } else {
      _startBioMetricAuth("Gunakan Fingerprint untuk melakukan autentikasi.");
    }
  }

  void _startBioMetricAuth(String message) async {
    log('_startBioMetricAuth');

    try {
      bool didAuthenticate = await auth.authenticate(
        localizedReason: message,
      );
      if (didAuthenticate) {
        Get.snackbar("Pesan", "Berhasil mengautentikasi");
        final pref = await SharedPreferences.getInstance();
        pref.setString('TOKEN', '1');
        Get.offAllNamed(Routes.HOME);
        // setState(() {
        //   _resultColor = Colors.green;
        //   _resultText = "Autentikasi berhasil.";
        // });
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        print("Error!");
      }
    }
  }

  loginFingerPrint() async {
    EasyLoading.show(status: 'Mengecek...');

    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    EasyLoading.dismiss();
    if (canAuthenticate)
      _auth();
    else
      Get.snackbar('Pesan', 'Tidak support biometric auth');
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
