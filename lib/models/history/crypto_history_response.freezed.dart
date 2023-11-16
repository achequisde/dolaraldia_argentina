// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_history_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CryptoHistoryResponse _$CryptoHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return _CryptoHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$CryptoHistoryResponse {
  List<CryptoHistoryEntry> get data => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CryptoHistoryResponseCopyWith<CryptoHistoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoHistoryResponseCopyWith<$Res> {
  factory $CryptoHistoryResponseCopyWith(CryptoHistoryResponse value,
          $Res Function(CryptoHistoryResponse) then) =
      _$CryptoHistoryResponseCopyWithImpl<$Res, CryptoHistoryResponse>;
  @useResult
  $Res call({List<CryptoHistoryEntry> data, int timestamp});
}

/// @nodoc
class _$CryptoHistoryResponseCopyWithImpl<$Res,
        $Val extends CryptoHistoryResponse>
    implements $CryptoHistoryResponseCopyWith<$Res> {
  _$CryptoHistoryResponseCopyWithImpl(this._value, this._then);

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
              as List<CryptoHistoryEntry>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CryptoHistoryResponseImplCopyWith<$Res>
    implements $CryptoHistoryResponseCopyWith<$Res> {
  factory _$$CryptoHistoryResponseImplCopyWith(
          _$CryptoHistoryResponseImpl value,
          $Res Function(_$CryptoHistoryResponseImpl) then) =
      __$$CryptoHistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CryptoHistoryEntry> data, int timestamp});
}

/// @nodoc
class __$$CryptoHistoryResponseImplCopyWithImpl<$Res>
    extends _$CryptoHistoryResponseCopyWithImpl<$Res,
        _$CryptoHistoryResponseImpl>
    implements _$$CryptoHistoryResponseImplCopyWith<$Res> {
  __$$CryptoHistoryResponseImplCopyWithImpl(_$CryptoHistoryResponseImpl _value,
      $Res Function(_$CryptoHistoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? timestamp = null,
  }) {
    return _then(_$CryptoHistoryResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CryptoHistoryEntry>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CryptoHistoryResponseImpl implements _CryptoHistoryResponse {
  const _$CryptoHistoryResponseImpl(
      {required final List<CryptoHistoryEntry> data, required this.timestamp})
      : _data = data;

  factory _$CryptoHistoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoHistoryResponseImplFromJson(json);

  final List<CryptoHistoryEntry> _data;
  @override
  List<CryptoHistoryEntry> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int timestamp;

  @override
  String toString() {
    return 'CryptoHistoryResponse(data: $data, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoHistoryResponseImpl &&
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
  _$$CryptoHistoryResponseImplCopyWith<_$CryptoHistoryResponseImpl>
      get copyWith => __$$CryptoHistoryResponseImplCopyWithImpl<
          _$CryptoHistoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoHistoryResponseImplToJson(
      this,
    );
  }
}

abstract class _CryptoHistoryResponse implements CryptoHistoryResponse {
  const factory _CryptoHistoryResponse(
      {required final List<CryptoHistoryEntry> data,
      required final int timestamp}) = _$CryptoHistoryResponseImpl;

  factory _CryptoHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$CryptoHistoryResponseImpl.fromJson;

  @override
  List<CryptoHistoryEntry> get data;
  @override
  int get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$CryptoHistoryResponseImplCopyWith<_$CryptoHistoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
