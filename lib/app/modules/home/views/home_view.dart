import 'package:catatan/app/constants/colors_app.dart';
import 'package:catatan/app/constants/empty_padding.dart';
import 'package:catatan/app/constants/shadow.dart';
import 'package:catatan/app/constants/typography.dart';
import 'package:catatan/app/routes/app_pages.dart';
import 'package:catatan/app/widgets/radius.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // final double itemHeight = (Get.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = Get.width / 2;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: AppColors.celticBlue,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'System Info',
          style: AppTypography.appBarTitle
              .copyWith(color: AppColors.white, fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {
                controller.signOut();
              },
              icon: Icon(Icons.exit_to_app_rounded))
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: Get.height / 3,
            width: Get.width,
            color: AppColors.celticBlue,
          ),
          Column(
            children: [24.ph, _headCard(), 24.ph, _menuHome()],
          ),
        ],
      ),
    );
  }

  Container _headCard() {
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: AppRadius.md,
          color: AppColors.white,
          boxShadow: AppShadow.md),
      child: Column(
        children: [
          Obx(() => Text(
                '${controller.datetime.value}',
                style: AppTypography.mediumBold,
              )),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.gps_fixed_sharp),
                  6.ph,
                  Obx(() => Text(
                        'Lat : ${controller.currentPosition.value.latitude}\nLong : ${controller.currentPosition.value.longitude}',
                        style: AppTypography.smallMedium,
                      ))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Expanded _menuHome() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        decoration: BoxDecoration(
            boxShadow: AppShadow.md,
            color: AppColors.white,
            borderRadius: AppRadius.md),
        child: GridView.count(
          padding: EdgeInsets.symmetric(horizontal: 24),
          crossAxisCount: 4,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          children: [
            _menuIcons('Baterai', () {
              Get.toNamed(Routes.BATTERY);
            }, Icons.battery_5_bar_rounded),
            _menuIcons('Sensor', () {
              Get.toNamed(Routes.SENSOR);
            }, Icons.sensors),
            _menuIcons('Device', () {
              Get.toNamed(Routes.DEVICE);
            }, Icons.device_unknown_rounded),
            _menuIcons('Map', () {
              Get.toNamed(Routes.MAP);
            }, Icons.map),
          ],
        ),
      ),
    );
  }

  Widget _menuIcons(String title, VoidCallback onTap, IconData icon) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            boxShadow: AppShadow.md,
            color: AppColors.white,
            borderRadius: AppRadius.md),
        child: Column(
          children: [
            Icon(icon),
            6.ph,
            Text(
              '${title}',
              style: AppTypography.extraSmallRegular,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ],
        ),
      ),
    );
  }
}
