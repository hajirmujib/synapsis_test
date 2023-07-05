import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppImageNetwork extends StatelessWidget {
  final String? placeholder;
  final String? image;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius radius;
  final BoxBorder? border;
  const AppImageNetwork({
    Key? key,
    this.placeholder,
    required this.image,
    required this.width,
    required this.height,
    this.radius = BorderRadius.zero,
    this.fit = BoxFit.fill,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image ?? '',
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
          borderRadius: radius,
          // border: Border.all(color: Colors.red, width: 2),
          border: border,
        ),
      ),
      placeholder: (context, url) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: radius,
          // border: Border.all(color: Colors.red, width: 2),
          border: border,
        ),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: radius,
          // border: Border.all(color: Colors.red, width: 2),
          border: border,
        ),
        child: Icon(
          Icons.error,
          size: 22,
        ),
      ),
    );
  }
}
