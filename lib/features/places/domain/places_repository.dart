import 'place_model.dart';

abstract class PlacesRepository {
  Future<List<PlaceModel>> searchCities(String query);
}