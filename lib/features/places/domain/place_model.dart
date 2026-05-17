import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

@freezed
class PlaceModel with _$PlaceModel {
  const factory PlaceModel({
    required String placeId,
    required String name,
    required String address,
    required double lat,
    required double lng,
    @Default('') String photoUrl,
    @Default(0.0) double rating,
    @Default('') String type,
  }) = _PlaceModel;

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);
}
