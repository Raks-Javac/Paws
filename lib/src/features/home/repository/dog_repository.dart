import 'package:paws/src/core/network/app_urls.dart';
import 'package:paws/src/core/network/network_service.dart';

abstract class AbstractDogRepository {
  Future<Map<String, dynamic>> getAllBreeds();
  Future<Map<String, dynamic>> getRandomImageByBreed(String breedName);
  Future<Map<String, dynamic>> getRandomImageBySubBreed(
      String breedName, String subBreed);
  Future<Map<String, dynamic>> imageListByBreed(String breedName);
  Future<Map<String, dynamic>> imageListBySubBreed(
      String breedName, String subBreedName);
}

class DogRepository implements AbstractDogRepository {
  final PawNetworkService _networkService;
  DogRepository(this._networkService);

// Get all breeds
  @override
  Future<Map<String, dynamic>> getAllBreeds() {
    final getAllBreedsRequest =
        _networkService.getRequest(AppUrls.allBreedsUrl);

    return getAllBreedsRequest;
  }

  @override
  Future<Map<String, dynamic>> getRandomImageByBreed(String breedName) {
    final getImageByBreedRequest = _networkService.getRequest(
        "${AppUrls.breedService}/$breedName${AppUrls.getRandomImageByBreedUrl}");

    return getImageByBreedRequest;
  }

  @override
  Future<Map<String, dynamic>> imageListByBreed(String breedName) {
    final getAllBreedsRequest = _networkService.getRequest(
        "${AppUrls.breedService}/$breedName${AppUrls.imageListByBreed}");

    return getAllBreedsRequest;
  }

  @override
  Future<Map<String, dynamic>> getRandomImageBySubBreed(
      String breedName, String subBreed) {
    final getAllBreedsRequest = _networkService.getRequest(
        "${AppUrls.breedService}/$breedName/$subBreed${AppUrls.getRandomImageByBreedUrl}");

    return getAllBreedsRequest;
  }

  @override
  Future<Map<String, dynamic>> imageListBySubBreed(
      String breedName, String subBreedName) {
    final getAllBreedsRequest = _networkService.getRequest(
        "${AppUrls.breedService}/$breedName/$subBreedName/${AppUrls.imageListByBreed}");

    return getAllBreedsRequest;
  }
}
