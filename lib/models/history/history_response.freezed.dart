// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryResponse _$HistoryResponseFromJson(Map<String, dynamic> json) {
  return _HistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$HistoryResponse {
  @JsonKey(name: 'PriceDataHistory')
  List<HistoryDateGroup>? get priceDataHistory =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryResponseCopyWith<HistoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryResponseCopyWith<$Res> {
  factory $HistoryResponseCopyWith(
          HistoryResponse value, $Res Function(HistoryResponse) then) =
      _$HistoryResponseCopyWithImpl<$Res, HistoryResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PriceDataHistory')
      List<HistoryDateGroup>? priceDataHistory});
}

/// @nodoc
class _$HistoryResponseCopyWithImpl<$Res, $Val extends HistoryResponse>
    implements $HistoryResponseCopyWith<$Res> {
  _$HistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceDataHistory = freezed,
  }) {
    return _then(_value.copyWith(
      priceDataHistory: freezed == priceDataHistory
          ? _value.priceDataHistory
          : priceDataHistory // ignore: cast_nullable_to_non_nullable
              as List<HistoryDateGroup>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryResponseImplCopyWith<$Res>
    implements $HistoryResponseCopyWith<$Res> {
  factory _$$HistoryResponseImplCopyWith(_$HistoryResponseImpl value,
          $Res Function(_$HistoryResponseImpl) then) =
      __$$HistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PriceDataHistory')
      List<HistoryDateGroup>? priceDataHistory});
}

/// @nodoc
class __$$HistoryResponseImplCopyWithImpl<$Res>
    extends _$HistoryResponseCopyWithImpl<$Res, _$HistoryResponseImpl>
    implements _$$HistoryResponseImplCopyWith<$Res> {
  __$$HistoryResponseImplCopyWithImpl(
      _$HistoryResponseImpl _value, $Res Function(_$HistoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceDataHistory = freezed,
  }) {
    return _then(_$HistoryResponseImpl(
      priceDataHistory: freezed == priceDataHistory
          ? _value._priceDataHistory
          : priceDataHistory // ignore: cast_nullable_to_non_nullable
              as List<HistoryDateGroup>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryResponseImpl implements _HistoryResponse {
  const _$HistoryResponseImpl(
      {@JsonKey(name: 'PriceDataHistory')
      required final List<HistoryDateGroup>? priceDataHistory})
      : _priceDataHistory = priceDataHistory;

  factory _$HistoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryResponseImplFromJson(json);

  final List<HistoryDateGroup>? _priceDataHistory;
  @override
  @JsonKey(name: 'PriceDataHistory')
  List<HistoryDateGroup>? get priceDataHistory {
    final value = _priceDataHistory;
    if (value == null) return null;
    if (_priceDataHistory is EqualUnmodifiableListView)
      return _priceDataHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HistoryResponse(priceDataHistory: $priceDataHistory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._priceDataHistory, _priceDataHistory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_priceDataHistory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryResponseImplCopyWith<_$HistoryResponseImpl> get copyWith =>
      __$$HistoryResponseImplCopyWithImpl<_$HistoryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryResponseImplToJson(
      this,
    );
  }
}

abstract class _HistoryResponse implements HistoryResponse {
  const factory _HistoryResponse(
          {@JsonKey(name: 'PriceDataHistory')
          required final List<HistoryDateGroup>? priceDataHistory}) =
      _$HistoryResponseImpl;

  factory _HistoryResponse.fromJson(Map<String, dynamic> json) =
      _$HistoryResponseImpl.fromJson;

  @override
  @JsonKey(name: 'PriceDataHistory')
  List<HistoryDateGroup>? get priceDataHistory;
  @override
  @JsonKey(ignore: true)
  _$$HistoryResponseImplCopyWith<_$HistoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
