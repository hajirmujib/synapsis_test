import 'package:catatan/app/constants/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ItemShimmer extends StatelessWidget {
  const ItemShimmer({
    super.key,
    this.width = 32,
    this.heigh = 32,
    this.padding,
    this.radius = 8,
    this.border,
  });

  final double width;
  final double heigh;
  final EdgeInsetsGeometry? padding;
  final double radius;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmer,
      highlightColor: AppColors.shimmerHiglight,
      child: Container(
        width: width,
        height: heigh,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
          color: Colors.blue[600],
          border: border,
        ),
      ),
    );
  }
}
