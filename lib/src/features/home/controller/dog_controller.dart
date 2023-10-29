import 'package:flutter/material.dart';
import 'package:paws/src/features/home/data/get_all_breeds_model.dart';
import 'package:paws/src/features/home/repository/dog_repository.dart';

class DogBreedProvider with ChangeNotifier {
  DogRepository dogRepository;

  DogBreedProvider(this.dogRepository);
  List<String> dogBreedsNames = [];
  List<String> defaultBreedList = [];
  GetAllDogModel? allBreedData;
  bool firstTimeBreedLoading = false;

  // Function to extract dog breeds from the map
  void extractDogBreeds(Map<String, List<String>> data) {
    dogBreedsNames = data.keys.toList();
    defaultBreedList = dogBreedsNames;
    notifyListeners();
  }

  //filter dog breeed
  void filterDogBreeds(String filter) {
    if (filter.isNotEmpty) {
      List<String> filteredList = dogBreedsNames
          .where((breed) =>
              !breed.toString().toLowerCase().contains(filter.toLowerCase()))
          .toList();
      dogBreedsNames = filteredList;
    } else {
      dogBreedsNames = defaultBreedList;
    }
    notifyListeners();
  }

//get all dog breed
  Future<void> getAllBreedsList() async {
    if (firstTimeBreedLoading == false) {
      GetAllDogModel listRequest = await dogRepository.getAllBreeds();

      extractDogBreeds(listRequest.breeds);
      allBreedData = listRequest;
      firstTimeBreedLoading = true;
      notifyListeners();
    }
  }
}
