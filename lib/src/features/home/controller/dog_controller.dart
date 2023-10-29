import 'package:flutter/material.dart';
import 'package:paws/src/features/home/data/get_all_breeds_model.dart';
import 'package:paws/src/features/home/repository/dog_repository.dart';

class DogBreedProvider with ChangeNotifier {
  DogRepository dogRepository;

  DogBreedProvider(this.dogRepository);
  List<String> dogBreeds = [];

  // Function to extract dog breeds from the map
  void extractDogBreeds(Map<String, dynamic> data) {
    final message = data["message"] as Map<String, dynamic>;
    dogBreeds = message.keys.toList();
    notifyListeners();
  }

  Future<GetAllDogModel> getAllBreedsList() async {
    final listRequest = await dogRepository.getAllBreeds();

    // extractDogBreeds(listRequest.breeds);
    return listRequest;
  }
}
