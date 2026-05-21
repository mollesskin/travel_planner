import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/place_model.dart';
import '../domain/places_repository.dart';
import 'places_api_service.dart';

final placesRepositoryProvider = Provider<PlacesRepository>((ref) {
  return PlacesRepositoryImpl(PlacesApiService.create());
});

class PlacesRepositoryImpl implements PlacesRepository {
  final PlacesApiService _api;
  PlacesRepositoryImpl(this._api);

  @override
  Future<List<PlaceModel>> searchCities(String query) async {
    try {
      final response = await _api.getCitiesInCountry({"country": "Kazakhstan"});
      
      if (response.isSuccessful) {
        final data = response.body['data'] as List<dynamic>? ?? [];
        return data
            .where((city) => city.toString().toLowerCase().contains(query.toLowerCase()))
            .map((cityName) => PlaceModel(
                  city: cityName.toString(),
                  country: "Kazakhstan",
                ))
            .toList();
      }
    } catch (e) {
      print('API Error: $e');
    }

    return [
      PlaceModel(city: "Astana", country: "Kazakhstan"),
      PlaceModel(city: "Almaty", country: "Kazakhstan"),
      PlaceModel(city: "Shymkent", country: "Kazakhstan"),
      PlaceModel(city: "Karaganda", country: "Kazakhstan"),
    ];
  }
}