import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_model.freezed.dart';
part 'trip_model.g.dart';

@freezed
class TripModel with _$TripModel {
  const factory TripModel({
    required String id,
    required String title,
    required String destination,
    required DateTime startDate,
    required DateTime endDate,
    @Default([]) List<String> collaborators,
    @Default('') String imageUrl,
    @Default('') String notes,
  }) = _TripModel;

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);
}
