import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:paws/src/core/network/app_urls.dart';
import 'package:paws/src/core/network/network_service.dart';

class MockClient extends Mock implements AbstractPawNetworkService {}

void main() {
  group('PawNetworkService', () {
    MockClient? mockClient;
    PawNetworkService? pawNetworkService;

    setUp(() {
      mockClient = MockClient();
      pawNetworkService = PawNetworkService();
    });

    test('getRequest returns JSON on success', () async {
      final url =
          "${AppUrls.breedService}/hound${AppUrls.getRandomImageByBreedUrl}";
      //sample response
      final responseJson = {
        "message":
            "https://images.dog.ceo/breeds/greyhound-italian/n02091032_1228.jpg",
        "status": "success"
      };
      final successResponse = http.Response(jsonEncode(responseJson), 200);

      when(mockClient!
          .getRequest(AppUrls.baseUrl + url)
          .then((_) async => successResponse));

      final result = await pawNetworkService?.getRequest(url);

      expect(result, responseJson);
    });

    test('getRequest throws exception on failure', () async {
      const url = '/sample';
      final errorResponse = http.Response('Error', 404);

      when(mockClient!
          .getRequest(AppUrls.baseUrl + url)
          .then((_) async => errorResponse));

      expect(() async {
        await pawNetworkService?.getRequest(url);
      }, throwsException);
    });
  });
}
