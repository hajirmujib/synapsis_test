import 'dart:async';

import 'package:battery_info/battery_info_plugin.dart';
import 'package:get/get.dart';

class BatteryController extends GetxController {
  final batteryLevel = ''.obs;
  final batteryHealth = ''.obs;
  final batteryCapacity = ''.obs;
  final batteryTech = ''.obs;

  //battery
  void _getBattery() async {
    batteryLevel.value =
        (await BatteryInfoPlugin().androidBatteryInfo)!.batteryLevel.toString();
    batteryCapacity.value = (await BatteryInfoPlugin().androidBatteryInfo)!
        .batteryCapacity
        .toString();
    batteryTech.value =
        (await BatteryInfoPlugin().androidBatteryInfo)!.technology.toString();
  }

  @override
  void onInit() {
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getBattery());

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
