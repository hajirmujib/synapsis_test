import 'package:catatan/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class MapController extends GetxController {
  final position = Get.find<HomeController>().currentPosition.value;
  @override
  void onInit() {
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
