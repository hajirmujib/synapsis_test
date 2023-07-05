import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorController extends GetxController {
  final acce = AccelerometerEvent(0.0, 0.0, 0.0).obs;
  final gyro = GyroscopeEvent(0.0, 0.0, 0.0).obs;
  final magne = MagnetometerEvent(0.0, 0.0, 0.0).obs;

  getCensor() {
    print('get sensor');
    accelerometerEvents.listen(
      (AccelerometerEvent event) {
        print(event);
        acce.value = event;
      },
      onError: (error) {
        Get.snackbar('Pesan', 'Gagal mengambil info accelerometer');
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
// [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]

    gyroscopeEvents.listen(
      (GyroscopeEvent event) {
        print(event);
        gyro.value = event;
      },
      onError: (error) {
        Get.snackbar('Pesan', 'Gagal mengambil info gyro');

        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
// [GyroscopeEvent (x: 0.0, y: 0.0, z: 0.0)]

    magnetometerEvents.listen(
      (MagnetometerEvent event) {
        print(event);
        magne.value = event;
      },
      onError: (error) {
        Get.snackbar('Pesan', 'Gagal mengambil info magnetometer');

        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
  }

  @override
  void onInit() {
    getCensor();
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
