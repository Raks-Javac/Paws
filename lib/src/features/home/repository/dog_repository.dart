import 'package:paws/src/core/network/api_response_model.dart';
import 'package:paws/src/core/network/app_urls.dart';
import 'package:paws/src/core/network/network_service.dart';
import 'package:paws/src/features/home/data/get_all_breeds_model.dart';

abstract class AbstractDogRepository {
  Future<GetAllDogModel> getAllBreeds();
  Future<String> getRandomImageByBreed(String breedName);
  Future<String> getRandomImageBySubBreed(String breedName, String subBreed);
  Future<Map<String, dynamic>> imageListByBreed(String breedName);
  Future<Map<String, dynamic>> imageListBySubBreed(
      String breedName, String subBreedName);
}

class DogRepository implements AbstractDogRepository {
  final PawNetworkService _networkService;
  DogRepository(this._networkService);

// Get all breeds
  @override
  Future<GetAllDogModel> getAllBreeds() async {
    final getAllBreedsRequest =
        await _networkService.getRequest(AppUrls.allBreedsUrl);

    ApiResponse response = ApiResponse.fromJson(getAllBreedsRequest);

    GetAllDogModel getAllDogsModel = GetAllDogModel.fromJson(response.message);

    return getAllDogsModel;
  }

  @override
  Future<String> getRandomImageByBreed(String breedName) async {
    final getImageByBreedRequest = await _networkService.getRequest(
        "${AppUrls.breedService}/$breedName${AppUrls.getRandomImageByBreedUrl}");

    ApiResponse response = ApiResponse.fromJson(getImageByBreedRequest);
    return response.message;
  }

  @override
  Future<Map<String, dynamic>> imageListByBreed(String breedName) async {
    final getAllBreedsRequest = await _networkService.getRequest(
        "${AppUrls.breedService}/$breedName${AppUrls.imageListByBreed}");

    return getAllBreedsRequest;
  }

  @override
  Future<String> getRandomImageBySubBreed(
      String breedName, String subBreed) async {
    final getSubBreedRandomImage = await _networkService.getRequest(
        "${AppUrls.breedService}/$breedName/$subBreed${AppUrls.getRandomImageByBreedUrl}");
    ApiResponse response = ApiResponse.fromJson(getSubBreedRandomImage);
    return response.message;
  }

  @override
  Future<Map<String, dynamic>> imageListBySubBreed(
      String breedName, String subBreedName) async {
    final getAllBreedsRequest = await _networkService.getRequest(
        "${AppUrls.breedService}/$breedName/$subBreedName/${AppUrls.imageListByBreed}");

    return getAllBreedsRequest;
  }
}
