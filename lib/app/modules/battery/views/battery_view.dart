import 'package:catatan/app/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/battery_controller.dart';

class BatteryView extends GetView<BatteryController> {
  const BatteryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            Obx(() => _rowInfo(
                'Battery Level', ' : ${controller.batteryLevel.value}%')),
            Obx(() => _rowInfo(
                'Battery Health', ' : ${controller.batteryHealth.value}')),
            Obx(() => _rowInfo(
                'Battery Technology', ' : ${controller.batteryTech.value}')),
          ],
        ),
      ),
    );
  }

  Widget _rowInfo(String title, String value) {
    return Row(
      children: [
        Text(
          title,
          style: AppTypography.smallMedium,
        ),
        Expanded(
            child: Text(
          value,
          style: AppTypography.smallRegular,
        ))
      ],
    ).marginOnly(bottom: 6);
  }
}
