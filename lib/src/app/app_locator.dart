import 'package:paws/src/core/navigation/navigation.dart';
import 'package:paws/src/core/network/network_service.dart';
import 'package:paws/src/features/home/controller/dog_controller.dart';
import 'package:paws/src/features/home/repository/dog_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final appRouter = AppRouter();
final networksService = PawNetworkService();
final dogRepository = DogRepository(networksService);

//controllers

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) {
      return DogBreedProvider(dogRepository);
    },
  ),
];
