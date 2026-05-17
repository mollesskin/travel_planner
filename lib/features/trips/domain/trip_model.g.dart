// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripModelImpl _$$TripModelImplFromJson(Map<String, dynamic> json) =>
    _$TripModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      destination: json['destination'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      collaborators: (json['collaborators'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      imageUrl: json['imageUrl'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
    );

Map<String, dynamic> _$$TripModelImplToJson(_$TripModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'destination': instance.destination,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'collaborators': instance.collaborators,
      'imageUrl': instance.imageUrl,
      'notes': instance.notes,
    };
