import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paws/src/app/app_locator.dart';
import 'package:paws/src/core/navigation/routes.dart';
import 'package:paws/src/core/utls/extensions/extensions.dart';
import 'package:paws/src/res/colors.dart';
import 'package:paws/src/res/theme_extensions/app_typography.dart';
import 'package:paws/src/shared/loader.dart';

class ImageViewAndTitle extends StatelessWidget {
  final String? title;
  const ImageViewAndTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PawTypography? typography =
        context.appTheme.extension<PawTypography>();
    return GestureDetector(
      onTap: () {
        appRouter.pushNamed(AppRoute.subBreedView);
      },
      child: Container(
        height: 220.sp,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: CachedNetworkImage(
          imageUrl: "https://images.dog.ceo/breeds/spitz-japanese/tofu.jpg",
          imageBuilder: (context, imageProvider) => Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 45.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: PawAppColors.pawBlack.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.sp),
                        bottomRight: Radius.circular(20.sp),
                      ),
                    ),
                    child: Text(
                      "Helofff Heighend well",
                      style: typography?.medium?.copyWith(
                        color: PawAppColors.pawWhite,
                      ),
                    ).center,
                  )
                ],
              )
            ],
          ),
          placeholder: (context, url) => ImageLoader(
            height: 45.sp,
            width: double.infinity,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
