// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceModelImpl _$$PlaceModelImplFromJson(Map<String, dynamic> json) =>
    _$PlaceModelImpl(
      placeId: json['placeId'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      photoUrl: json['photoUrl'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$$PlaceModelImplToJson(_$PlaceModelImpl instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'name': instance.name,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'photoUrl': instance.photoUrl,
      'rating': instance.rating,
      'type': instance.type,
    };
