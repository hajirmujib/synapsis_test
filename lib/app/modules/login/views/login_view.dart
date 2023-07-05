// import 'dart:math';

import 'dart:developer';

import 'package:catatan/app/constants/colors_app.dart';
import 'package:catatan/app/constants/empty_padding.dart';
import 'package:catatan/app/constants/typography.dart';
import 'package:catatan/app/routes/app_pages.dart';
import 'package:catatan/app/widgets/extra_small_button.dart';
import 'package:catatan/app/widgets/global_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: ListView(
          children: [
            Center(
              child: Text(
                'Login',
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
                    title: 'Login',
                    backgroundColor: AppColors.celticBlue,
                    onPressed: !controller.isValid.value
                        ? null
                        : () {
                            FocusScope.of(context).unfocus();
                            controller.login();
                            log('Login');
                          },
                  )),
            ),
            24.ph,
            InkWell(
              onTap: () {
                // Get.toNamed(Routes.REGISTER);
                controller.loginFingerPrint();
              },
              child: Text(
                'Masuk menggunakan fingerprint',
                style: AppTypography.normalBold
                    .copyWith(color: AppColors.celticBlue),
              ),
            ),
            16.ph,
            Row(
              children: [
                Text(
                  'Belum punya akun?',
                  style: AppTypography.smallMedium,
                ),
                6.pw,
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: Text(
                    'Register',
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
