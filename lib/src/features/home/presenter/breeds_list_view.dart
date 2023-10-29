import 'package:flutter/material.dart';
import 'package:paws/src/core/utls/extensions/extensions.dart';
import 'package:paws/src/core/utls/helper_functions/functions.dart';
import 'package:paws/src/features/home/controller/dog_controller.dart';
import 'package:paws/src/shared/image_view.dart';
import 'package:paws/src/shared/loader.dart';
import 'package:provider/provider.dart';

class BreedListView extends StatelessWidget {
  const BreedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DogBreedProvider>(builder: (context, provider, _) {
      return FutureBuilder<void>(
          future: provider.getAllBreedsList(),
          builder: (context, snapshot) {
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
            } else {
              return Column(
                children: [
                  for (int i = 0; i < provider.dogBreedsName.length; i++) ...[
                    ImageViewAndTitle(
                      title: provider.dogBreedsName[i],
                    ),
                    addVerticalSpacing(20),
                  ],
                  if (provider.dogBreedsName.isEmpty)
                    const Text("No dog found ")
                ],
              );
            }
          });
    });
  }
}
