import 'package:catatan/app/constants/colors_app.dart';
import 'package:catatan/app/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  const LandingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text(
              '${controller.title.value}',
              style: AppTypography.mediumBold
                  .copyWith(color: AppColors.celticBlue),
            )),
      ),
    );
  }
}
