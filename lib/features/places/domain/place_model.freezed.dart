// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceModel _$PlaceModelFromJson(Map<String, dynamic> json) {
  return _PlaceModel.fromJson(json);
}

/// @nodoc
mixin _$PlaceModel {
  String get placeId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Serializes this PlaceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceModelCopyWith<PlaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceModelCopyWith<$Res> {
  factory $PlaceModelCopyWith(
          PlaceModel value, $Res Function(PlaceModel) then) =
      _$PlaceModelCopyWithImpl<$Res, PlaceModel>;
  @useResult
  $Res call(
      {String placeId,
      String name,
      String address,
      double lat,
      double lng,
      String photoUrl,
      double rating,
      String type});
}

/// @nodoc
class _$PlaceModelCopyWithImpl<$Res, $Val extends PlaceModel>
    implements $PlaceModelCopyWith<$Res> {
  _$PlaceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? name = null,
    Object? address = null,
    Object? lat = null,
    Object? lng = null,
    Object? photoUrl = null,
    Object? rating = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceModelImplCopyWith<$Res>
    implements $PlaceModelCopyWith<$Res> {
  factory _$$PlaceModelImplCopyWith(
          _$PlaceModelImpl value, $Res Function(_$PlaceModelImpl) then) =
      __$$PlaceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String placeId,
      String name,
      String address,
      double lat,
      double lng,
      String photoUrl,
      double rating,
      String type});
}

/// @nodoc
class __$$PlaceModelImplCopyWithImpl<$Res>
    extends _$PlaceModelCopyWithImpl<$Res, _$PlaceModelImpl>
    implements _$$PlaceModelImplCopyWith<$Res> {
  __$$PlaceModelImplCopyWithImpl(
      _$PlaceModelImpl _value, $Res Function(_$PlaceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? name = null,
    Object? address = null,
    Object? lat = null,
    Object? lng = null,
    Object? photoUrl = null,
    Object? rating = null,
    Object? type = null,
  }) {
    return _then(_$PlaceModelImpl(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceModelImpl implements _PlaceModel {
  const _$PlaceModelImpl(
      {required this.placeId,
      required this.name,
      required this.address,
      required this.lat,
      required this.lng,
      this.photoUrl = '',
      this.rating = 0.0,
      this.type = ''});

  factory _$PlaceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceModelImplFromJson(json);

  @override
  final String placeId;
  @override
  final String name;
  @override
  final String address;
  @override
  final double lat;
  @override
  final double lng;
  @override
  @JsonKey()
  final String photoUrl;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final String type;

  @override
  String toString() {
    return 'PlaceModel(placeId: $placeId, name: $name, address: $address, lat: $lat, lng: $lng, photoUrl: $photoUrl, rating: $rating, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceModelImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, placeId, name, address, lat, lng, photoUrl, rating, type);

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceModelImplCopyWith<_$PlaceModelImpl> get copyWith =>
      __$$PlaceModelImplCopyWithImpl<_$PlaceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceModelImplToJson(
      this,
    );
  }
}

abstract class _PlaceModel implements PlaceModel {
  const factory _PlaceModel(
      {required final String placeId,
      required final String name,
      required final String address,
      required final double lat,
      required final double lng,
      final String photoUrl,
      final double rating,
      final String type}) = _$PlaceModelImpl;

  factory _PlaceModel.fromJson(Map<String, dynamic> json) =
      _$PlaceModelImpl.fromJson;

  @override
  String get placeId;
  @override
  String get name;
  @override
  String get address;
  @override
  double get lat;
  @override
  double get lng;
  @override
  String get photoUrl;
  @override
  double get rating;
  @override
  String get type;

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceModelImplCopyWith<_$PlaceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
