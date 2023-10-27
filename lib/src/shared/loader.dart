import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoader extends StatelessWidget {
  final double? width;
  final double? height;
  const ImageLoader({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!, // Light gray
      highlightColor: Colors.grey[100]!, // Even lighter gray
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey[300], // The shimmer color
        ),
      ),
    );
  }
}
