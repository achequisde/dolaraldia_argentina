// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CryptoResponse _$CryptoResponseFromJson(Map<String, dynamic> json) {
  return _CryptoResponse.fromJson(json);
}

/// @nodoc
mixin _$CryptoResponse {
  List<CryptoRateData> get data => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CryptoResponseCopyWith<CryptoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoResponseCopyWith<$Res> {
  factory $CryptoResponseCopyWith(
          CryptoResponse value, $Res Function(CryptoResponse) then) =
      _$CryptoResponseCopyWithImpl<$Res, CryptoResponse>;
  @useResult
  $Res call({List<CryptoRateData> data, int timestamp});
}

/// @nodoc
class _$CryptoResponseCopyWithImpl<$Res, $Val extends CryptoResponse>
    implements $CryptoResponseCopyWith<$Res> {
  _$CryptoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CryptoRateData>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CryptoResponseImplCopyWith<$Res>
    implements $CryptoResponseCopyWith<$Res> {
  factory _$$CryptoResponseImplCopyWith(_$CryptoResponseImpl value,
          $Res Function(_$CryptoResponseImpl) then) =
      __$$CryptoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CryptoRateData> data, int timestamp});
}

/// @nodoc
class __$$CryptoResponseImplCopyWithImpl<$Res>
    extends _$CryptoResponseCopyWithImpl<$Res, _$CryptoResponseImpl>
    implements _$$CryptoResponseImplCopyWith<$Res> {
  __$$CryptoResponseImplCopyWithImpl(
      _$CryptoResponseImpl _value, $Res Function(_$CryptoResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? timestamp = null,
  }) {
    return _then(_$CryptoResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CryptoRateData>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CryptoResponseImpl implements _CryptoResponse {
  const _$CryptoResponseImpl(
      {required final List<CryptoRateData> data, required this.timestamp})
      : _data = data;

  factory _$CryptoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoResponseImplFromJson(json);

  final List<CryptoRateData> _data;
  @override
  List<CryptoRateData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int timestamp;

  @override
  String toString() {
    return 'CryptoResponse(data: $data, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoResponseImplCopyWith<_$CryptoResponseImpl> get copyWith =>
      __$$CryptoResponseImplCopyWithImpl<_$CryptoResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoResponseImplToJson(
      this,
    );
  }
}

abstract class _CryptoResponse implements CryptoResponse {
  const factory _CryptoResponse(
      {required final List<CryptoRateData> data,
      required final int timestamp}) = _$CryptoResponseImpl;

  factory _CryptoResponse.fromJson(Map<String, dynamic> json) =
      _$CryptoResponseImpl.fromJson;

  @override
  List<CryptoRateData> get data;
  @override
  int get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$CryptoResponseImplCopyWith<_$CryptoResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
