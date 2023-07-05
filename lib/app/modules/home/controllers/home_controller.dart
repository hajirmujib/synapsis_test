import 'dart:async';

import 'package:catatan/app/helper/maps_utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  final datetime = ''.obs;
  final currentPosition = Position(
          accuracy: 0,
          altitude: 0,
          heading: 0,
          latitude: 0,
          longitude: 0,
          speed: 0,
          speedAccuracy: 0,
          timestamp: DateTime.now())
      .obs;

  signOut() async {
    EasyLoading.show(status: 'Sign Out...');
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
    pref.setString('TOKEN', '');
    var token = await pref.getString('TOKEN');
    if (token == '') {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      EasyLoading.showError('Gagal logout');
    }

    EasyLoading.dismiss();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);

    datetime.value = formattedDateTime;
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }

  void _getLatLong() async {
    currentPosition.value = await MapUtils().determinePosition();
  }

  @override
  void onInit() {
    datetime.value = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    // Timer.periodic(Duration(seconds: 1), (Timer t) => _getLatLong());
    _getLatLong();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
