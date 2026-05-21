import 'package:chopper/chopper.dart';
import '../../../core/constants/api_constants.dart';
part 'places_api_service.chopper.dart'; // generated

@ChopperApi()
abstract class PlacesApiService extends ChopperService {

  @Post(path: '/countries/cities')
  Future<Response> getCitiesInCountry(
    @Body() Map<String, String> body,
  );

  static PlacesApiService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(ApiConstants.baseUrl),
      services: [_$PlacesApiService()],
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
    );
    return _$PlacesApiService(client);
  }
}