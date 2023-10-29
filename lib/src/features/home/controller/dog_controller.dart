import 'package:flutter/material.dart';
import 'package:paws/src/features/home/data/get_all_breeds_model.dart';
import 'package:paws/src/features/home/repository/dog_repository.dart';

class DogBreedProvider with ChangeNotifier {
  DogRepository dogRepository;

  DogBreedProvider(this.dogRepository);
  List<String> dogBreedsName = [];
  List<String> defaultBreedList = [];
  bool firstTimeBreedLoading = false;

  // Function to extract dog breeds from the map
  void extractDogBreeds(Map<String, List<String>> data) {
    dogBreedsName = data.keys.toList();
    notifyListeners();
  }

  Future<void> getAllBreedsList() async {
    if (firstTimeBreedLoading == false) {
      GetAllDogModel listRequest1 = await dogRepository.getAllBreeds();

      extractDogBreeds(listRequest1.breeds);
      firstTimeBreedLoading = true;
      notifyListeners();
    }
  }
}
