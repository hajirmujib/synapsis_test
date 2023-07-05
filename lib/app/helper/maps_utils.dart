import 'dart:developer';

// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';

class MapUtils {
  Future<Position> determinePosition() async {
    log(':: DETERMINE POSITION ::');
    //  bool serviceEnabled;
    LocationPermission permission;
    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   return Future.error('Layanan Lokasi dimatikan.');
    // }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log(':: Izin akses lokasi ditolak ::');

        return Future.error('Izin akses lokasi ditolak');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log(':: Izin akses lokasi ditolak secara permanen, kami tidak dapat meminta izin. ::');

      return Future.error(
          'Izin akses lokasi ditolak secara permanen, kami tidak dapat meminta izin.');
    }

    try {
      final res = await Geolocator.getCurrentPosition(
          forceAndroidLocationManager: true,
          desiredAccuracy: LocationAccuracy.best,
          timeLimit: Duration(seconds: 15));
      log(':: SUCCESS GET CURRENT LOCATION ${res.latitude},${res.longitude}::');
    } catch (e) {
      log(':: FAILED GET LOCATION : ${e}::');
    }

    return await Geolocator.getCurrentPosition(
        forceAndroidLocationManager: false,
        desiredAccuracy: LocationAccuracy.best,
        timeLimit: Duration(seconds: 15));
  }
}
