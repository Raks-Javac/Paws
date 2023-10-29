import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paws/src/core/utls/extensions/extensions.dart';
import 'package:paws/src/core/utls/helper_functions/functions.dart';
import 'package:paws/src/features/home/presenter/breeds_list_view.dart';
import 'package:paws/src/res/assets.dart';
import 'package:paws/src/res/strings.dart';
import 'package:paws/src/res/theme_extensions/app_palette.dart';
import 'package:paws/src/res/theme_extensions/app_typography.dart';
import 'package:paws/src/shared/logger.dart';
import 'package:paws/src/shared/render_assets.dart';
import 'package:paws/src/shared/search_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController textEditingController = TextEditingController();

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
            Container(
              width: double.infinity,
              height: 44.0.sp,
              decoration: BoxDecoration(
                border: Border.all(
                  color: palette!.textColor!,
                ),
                color: palette.backgroundColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Center(
                  child: Row(
                children: [
                  const PawsWidgetsRenderSvg(
                    svgPath: searchIcon,
                  ).marginSymmetric(horizontal: 5),
                  addHorizontalSpacing(5),
                  Expanded(
                    child: PawWidgetsSearchBar(
                      controller: textEditingController,
                      onChanged: (val) {
                        Logger.logInfo(val);
                      },
                    ),
                  )
                ],
              )),
            ),

            //
            addVerticalSpacing(40),
            Text(
              "Breeds",
              style: typography?.medium?.copyWith(fontWeight: FontWeight.bold),
            ),
            addVerticalSpacing(30),
            const Expanded(
                child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  BreedListView(),
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
