import 'package:flutter/material.dart';
import 'package:paws/src/core/utls/helper_functions/functions.dart';
import 'package:paws/src/res/assets.dart';
import 'package:paws/src/shared/render_assets.dart';
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

//genral loader

class PawsWidgetLoader extends StatelessWidget {
  const PawsWidgetLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PawsWidgetsRenderLottie(
          lottiePath: loaderLottie,
          isContinous: true,
        ),
        addVerticalSpacing(15),
        const Text("Loading....Please wait"),
      ],
    );
  }
}
//error widget

class PawsWidgetErrorWidget extends StatelessWidget {
  const PawsWidgetErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const PawsWidgetsRenderLottie(
      lottiePath: errorLottie,
      isContinous: true,
    );
  }
}
