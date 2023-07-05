import 'package:get/get.dart';

import '../modules/battery/bindings/battery_binding.dart';
import '../modules/battery/views/battery_view.dart';
import '../modules/device/bindings/device_binding.dart';
import '../modules/device/views/device_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/landing/bindings/landing_binding.dart';
import '../modules/landing/views/landing_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/map/bindings/map_binding.dart';
import '../modules/map/views/map_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/sensor/bindings/sensor_binding.dart';
import '../modules/sensor/views/sensor_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LANDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LANDING,
      page: () => const LandingView(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BATTERY,
      page: () => const BatteryView(),
      binding: BatteryBinding(),
    ),
    GetPage(
      name: _Paths.SENSOR,
      page: () => const SensorView(),
      binding: SensorBinding(),
    ),
    GetPage(
      name: _Paths.DEVICE,
      page: () => const DeviceView(),
      binding: DeviceBinding(),
    ),
    GetPage(
      name: _Paths.MAP,
      page: () => const MapView(),
      binding: MapBinding(),
    ),
  ];
}
