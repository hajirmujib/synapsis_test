import 'package:catatan/app/constants/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' hide MapController;
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  const MapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        width: Get.width,
        // height: 216,
        child: FlutterMap(
          options: MapOptions(
            keepAlive: true,
            center: LatLng(
                controller.position.latitude, controller.position.longitude),
            zoom: 16.4746,
            // maxZoom: 2,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(controller.position.latitude,
                      controller.position.longitude),
                  width: 22,
                  height: 22,
                  builder: (context) => Icon(
                    Icons.pin_drop,
                    color: AppColors.elektrikRed,
                  ),
                ),
              ],
            ),
          ],
          nonRotatedChildren: [
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () => launchUrl(
                      Uri.parse('https://openstreetmap.org/copyright')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
