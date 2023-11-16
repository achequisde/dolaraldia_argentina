// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_history_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CryptoHistoryEntry _$CryptoHistoryEntryFromJson(Map<String, dynamic> json) {
  return _CryptoHistoryEntry.fromJson(json);
}

/// @nodoc
mixin _$CryptoHistoryEntry {
  String get priceUsd => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CryptoHistoryEntryCopyWith<CryptoHistoryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoHistoryEntryCopyWith<$Res> {
  factory $CryptoHistoryEntryCopyWith(
          CryptoHistoryEntry value, $Res Function(CryptoHistoryEntry) then) =
      _$CryptoHistoryEntryCopyWithImpl<$Res, CryptoHistoryEntry>;
  @useResult
  $Res call({String priceUsd, String date});
}

/// @nodoc
class _$CryptoHistoryEntryCopyWithImpl<$Res, $Val extends CryptoHistoryEntry>
    implements $CryptoHistoryEntryCopyWith<$Res> {
  _$CryptoHistoryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceUsd = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      priceUsd: null == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CryptoHistoryEntryImplCopyWith<$Res>
    implements $CryptoHistoryEntryCopyWith<$Res> {
  factory _$$CryptoHistoryEntryImplCopyWith(_$CryptoHistoryEntryImpl value,
          $Res Function(_$CryptoHistoryEntryImpl) then) =
      __$$CryptoHistoryEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String priceUsd, String date});
}

/// @nodoc
class __$$CryptoHistoryEntryImplCopyWithImpl<$Res>
    extends _$CryptoHistoryEntryCopyWithImpl<$Res, _$CryptoHistoryEntryImpl>
    implements _$$CryptoHistoryEntryImplCopyWith<$Res> {
  __$$CryptoHistoryEntryImplCopyWithImpl(_$CryptoHistoryEntryImpl _value,
      $Res Function(_$CryptoHistoryEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceUsd = null,
    Object? date = null,
  }) {
    return _then(_$CryptoHistoryEntryImpl(
      priceUsd: null == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CryptoHistoryEntryImpl implements _CryptoHistoryEntry {
  const _$CryptoHistoryEntryImpl({required this.priceUsd, required this.date});

  factory _$CryptoHistoryEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoHistoryEntryImplFromJson(json);

  @override
  final String priceUsd;
  @override
  final String date;

  @override
  String toString() {
    return 'CryptoHistoryEntry(priceUsd: $priceUsd, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoHistoryEntryImpl &&
            (identical(other.priceUsd, priceUsd) ||
                other.priceUsd == priceUsd) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, priceUsd, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoHistoryEntryImplCopyWith<_$CryptoHistoryEntryImpl> get copyWith =>
      __$$CryptoHistoryEntryImplCopyWithImpl<_$CryptoHistoryEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoHistoryEntryImplToJson(
      this,
    );
  }
}

abstract class _CryptoHistoryEntry implements CryptoHistoryEntry {
  const factory _CryptoHistoryEntry(
      {required final String priceUsd,
      required final String date}) = _$CryptoHistoryEntryImpl;

  factory _CryptoHistoryEntry.fromJson(Map<String, dynamic> json) =
      _$CryptoHistoryEntryImpl.fromJson;

  @override
  String get priceUsd;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$CryptoHistoryEntryImplCopyWith<_$CryptoHistoryEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
