import 'package:catatan/app/constants/empty_padding.dart';
import 'package:catatan/app/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sensor_controller.dart';

class SensorView extends GetView<SensorController> {
  const SensorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensor'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            Obx(() => _rowInfo('Accelerometer',
                'x :${controller.acce.value.x},\ny :${controller.acce.value.y},\nz :${controller.acce.value.z}')),
            Obx(() => _rowInfo('Gyroscope',
                ' : x :${controller.gyro.value.x}, y :${controller.gyro.value.y}, z :${controller.gyro.value.z}')),
            Obx(() => _rowInfo('Magnetometer',
                ' : x :${controller.magne.value.x}, y :${controller.magne.value.y}, z :${controller.magne.value.z}')),
          ],
        ),
      ),
    );
  }

  Widget _rowInfo(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.smallMedium,
        ),
        6.pw,
        Expanded(
            child: Text(
          value,
          style: AppTypography.smallRegular,
        ))
      ],
    ).marginOnly(bottom: 6);
  }
}
