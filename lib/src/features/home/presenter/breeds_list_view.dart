import 'package:flutter/material.dart';
import 'package:paws/src/core/utls/extensions/extensions.dart';
import 'package:paws/src/core/utls/helper_functions/functions.dart';
import 'package:paws/src/features/home/controller/dog_controller.dart';
import 'package:paws/src/features/home/data/get_all_breeds_model.dart';
import 'package:paws/src/shared/image_view.dart';
import 'package:paws/src/shared/loader.dart';
import 'package:paws/src/shared/logger.dart';
import 'package:provider/provider.dart';

class BreedListView extends StatelessWidget {
  const BreedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DogBreedProvider>(builder: (context, provider, _) {
      return FutureBuilder<GetAllDogModel>(
          future: provider.getAllBreedsList(),
          builder: (context, snapshot) {
            Logger.logInfo(snapshot.data);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const PawsWidgetLoader().center.marginOnly(top: 10);
            } else if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  addVerticalSpacing(40),
                  const PawsWidgetErrorWidget(),
                  addVerticalSpacing(25),
                ],
              ).center.marginOnly(top: 5.5);
            } else if (snapshot.hasData) {
              return Column(
                children: [
                  for (int i = 0; i < snapshot.data!.breeds.length; i++) ...[
                    const ImageViewAndTitle(
                      title: null,
                    ),
                    addVerticalSpacing(20),
                  ]
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  addVerticalSpacing(40),
                  const PawsWidgetErrorWidget(),
                  addVerticalSpacing(25),
                ],
              ).center.marginOnly(top: 5.5);
            }
          });
    });
  }
}
