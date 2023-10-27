import 'package:paws/src/core/network/app_urls.dart';
import 'package:paws/src/core/network/network_service.dart';

abstract class AbstractDogRepository {
  Future<Map<String, dynamic>> getAllBreeds();
}

class DogRepository implements AbstractDogRepository {
  final PawNetworkService _networkService;
  DogRepository(this._networkService);

  @override
  Future<Map<String, dynamic>> getAllBreeds() {
    final getAllBreedsRequest =
        _networkService.getRequest(AppUrls.allBreedsUrl);

    return getAllBreedsRequest;
  }
}
