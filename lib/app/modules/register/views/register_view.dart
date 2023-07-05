import 'dart:developer';

import 'package:catatan/app/constants/colors_app.dart';
import 'package:catatan/app/constants/empty_padding.dart';
import 'package:catatan/app/constants/typography.dart';
import 'package:catatan/app/widgets/extra_small_button.dart';
import 'package:catatan/app/widgets/global_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: ListView(
          children: [
            Center(
              child: Text(
                'Register',
                style: AppTypography.mediumBold,
              ),
            ),
            20.ph,
            GlobalForm(
              textController: controller.email,
              labelText: 'Username',
            ),
            10.ph,
            GlobalForm(
              textController: controller.password,
              obscureText: true,
              labelText: 'Password',
            ),
            20.ph,
            SizedBox(
              height: 50,
              child: Obx(() => ExtraSmallButton(
                    color: AppColors.white,
                    title: 'Register',
                    backgroundColor: AppColors.celticBlue,
                    onPressed: !controller.isValid.value
                        ? null
                        : () {
                          FocusScope.of(context).unfocus();
                            controller.register();
                            log('REGISTER');
                          },
                  )),
            ),
            24.ph,
            Row(
              children: [
                Text(
                  'Sudah punya akun?',
                  style: AppTypography.smallMedium,
                ),
                6.pw,
                InkWell(
                  onTap: () {
                    // Get.toNamed(Routes.REGISTER);
                    Get.back();
                  },
                  child: Text(
                    'Login',
                    style: AppTypography.normalBold
                        .copyWith(color: AppColors.celticBlue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
