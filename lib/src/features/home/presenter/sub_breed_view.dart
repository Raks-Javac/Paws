import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paws/src/app/app_locator.dart';
import 'package:paws/src/core/utls/extensions/extensions.dart';
import 'package:paws/src/core/utls/helper_functions/functions.dart';
import 'package:paws/src/res/strings.dart';
import 'package:paws/src/res/theme_extensions/app_palette.dart';
import 'package:paws/src/res/theme_extensions/app_typography.dart';
import 'package:paws/src/shared/image_view.dart';
import 'package:paws/src/shared/loader.dart';

class SubBreedArgument {
  final List<String>? subBreed;
  final String? breed;
  SubBreedArgument({this.subBreed, this.breed});
}

class SubBreedViewScreen extends StatelessWidget {
  final SubBreedArgument subBreedArgument;
  const SubBreedViewScreen({super.key, required this.subBreedArgument});

  @override
  Widget build(BuildContext context) {
    final PawTypography? typography =
        context.appTheme.extension<PawTypography>();
    final PawPallete? palette = context.appTheme.extension<PawPallete>();
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        dismissKeyboard();
      },
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              PawsStrings.appName,
              style: typography?.medium?.copyWith(color: palette?.primaryColor),
            ).marginOnly(bottom: 20),

            //
            addVerticalSpacing(40),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    appRouter.pop();
                  },
                  child: Text(
                    "Breeds",
                    style: typography?.medium
                        ?.copyWith(fontWeight: FontWeight.w100),
                  ),
                ),
                addHorizontalSpacing(10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15.sp,
                ),
                addHorizontalSpacing(10),
                Text(
                  "Sub-breed",
                  style:
                      typography?.medium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            addVerticalSpacing(30),
            Expanded(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  if (subBreedArgument.subBreed!.isEmpty)
                    Column(
                      children: [
                        const PawsWidgetErrorWidget(),
                        addVerticalSpacing(20),
                        const Text("No Sub-breed found for this breed")
                            .marginSymmetric(horizontal: 20),
                      ],
                    ),
                  for (int i = 0;
                      i < subBreedArgument.subBreed!.length;
                      i++) ...[
                    ImageViewAndTitle(
                        future: dogRepository.getRandomImageBySubBreed(
                            subBreedArgument.breed ?? "",
                            subBreedArgument.subBreed?[i] ?? ""),
                        title: subBreedArgument.subBreed?[i] ?? ""),
                    addVerticalSpacing(20),
                  ]
                ],
              ),
            ))
            //
          ],
        ).marginSymmetric(vertical: 20, horizontal: 15),
      ),
    ));
  }
}
