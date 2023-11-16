// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_rate_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CryptoRateData _$CryptoRateDataFromJson(Map<String, dynamic> json) {
  return _CryptoRateData.fromJson(json);
}

/// @nodoc
mixin _$CryptoRateData {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get priceUsd => throw _privateConstructorUsedError;
  String? get changePercent24Hr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CryptoRateDataCopyWith<CryptoRateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoRateDataCopyWith<$Res> {
  factory $CryptoRateDataCopyWith(
          CryptoRateData value, $Res Function(CryptoRateData) then) =
      _$CryptoRateDataCopyWithImpl<$Res, CryptoRateData>;
  @useResult
  $Res call(
      {String id, String name, String priceUsd, String? changePercent24Hr});
}

/// @nodoc
class _$CryptoRateDataCopyWithImpl<$Res, $Val extends CryptoRateData>
    implements $CryptoRateDataCopyWith<$Res> {
  _$CryptoRateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? priceUsd = null,
    Object? changePercent24Hr = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      priceUsd: null == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as String,
      changePercent24Hr: freezed == changePercent24Hr
          ? _value.changePercent24Hr
          : changePercent24Hr // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CryptoRateDataImplCopyWith<$Res>
    implements $CryptoRateDataCopyWith<$Res> {
  factory _$$CryptoRateDataImplCopyWith(_$CryptoRateDataImpl value,
          $Res Function(_$CryptoRateDataImpl) then) =
      __$$CryptoRateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String priceUsd, String? changePercent24Hr});
}

/// @nodoc
class __$$CryptoRateDataImplCopyWithImpl<$Res>
    extends _$CryptoRateDataCopyWithImpl<$Res, _$CryptoRateDataImpl>
    implements _$$CryptoRateDataImplCopyWith<$Res> {
  __$$CryptoRateDataImplCopyWithImpl(
      _$CryptoRateDataImpl _value, $Res Function(_$CryptoRateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? priceUsd = null,
    Object? changePercent24Hr = freezed,
  }) {
    return _then(_$CryptoRateDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      priceUsd: null == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as String,
      changePercent24Hr: freezed == changePercent24Hr
          ? _value.changePercent24Hr
          : changePercent24Hr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CryptoRateDataImpl implements _CryptoRateData {
  const _$CryptoRateDataImpl(
      {required this.id,
      required this.name,
      required this.priceUsd,
      required this.changePercent24Hr});

  factory _$CryptoRateDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoRateDataImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String priceUsd;
  @override
  final String? changePercent24Hr;

  @override
  String toString() {
    return 'CryptoRateData(id: $id, name: $name, priceUsd: $priceUsd, changePercent24Hr: $changePercent24Hr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoRateDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.priceUsd, priceUsd) ||
                other.priceUsd == priceUsd) &&
            (identical(other.changePercent24Hr, changePercent24Hr) ||
                other.changePercent24Hr == changePercent24Hr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, priceUsd, changePercent24Hr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoRateDataImplCopyWith<_$CryptoRateDataImpl> get copyWith =>
      __$$CryptoRateDataImplCopyWithImpl<_$CryptoRateDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoRateDataImplToJson(
      this,
    );
  }
}

abstract class _CryptoRateData implements CryptoRateData {
  const factory _CryptoRateData(
      {required final String id,
      required final String name,
      required final String priceUsd,
      required final String? changePercent24Hr}) = _$CryptoRateDataImpl;

  factory _CryptoRateData.fromJson(Map<String, dynamic> json) =
      _$CryptoRateDataImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get priceUsd;
  @override
  String? get changePercent24Hr;
  @override
  @JsonKey(ignore: true)
  _$$CryptoRateDataImplCopyWith<_$CryptoRateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
