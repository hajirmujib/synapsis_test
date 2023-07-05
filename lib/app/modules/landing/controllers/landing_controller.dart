import 'dart:developer';

import 'package:catatan/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingController extends GetxController {
  final title = 'System Info'.obs;
  @override
  void onInit() async {
    log('LANDING INIT');
    Future.delayed(Duration(milliseconds: 500), () async {
      final pref = await SharedPreferences.getInstance();
      final token = pref.getString('TOKEN');
      if (token != '' ) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
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
