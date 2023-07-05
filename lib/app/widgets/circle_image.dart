import 'package:cached_network_image/cached_network_image.dart';
import 'package:catatan/app/constants/colors_app.dart';
import 'package:catatan/app/constants/iconUI_icons.dart';
import 'package:catatan/app/widgets/shimmer_item.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({super.key, required this.url, required this.size});
  final String url;
  final double size;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: size,
      height: size,
      imageUrl: url,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
        );
      },
      progressIndicatorBuilder: (context, url, downloadProgress) => ItemShimmer(
        width: size,
        heigh: size,
        radius: size,
      ),
      errorWidget: (context, url, error) => Container(
          padding: EdgeInsets.all(2),
          width: size,
          height: size,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.celticBlue),
            color: AppColors.celticBlue.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            IconUI.user_5661922,
            size: 22,
            color: AppColors.celticBlue,
          )),
    );
  }
}
