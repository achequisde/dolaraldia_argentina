// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_date_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryDateGroup _$HistoryDateGroupFromJson(Map<String, dynamic> json) {
  return _HistoryDateGroup.fromJson(json);
}

/// @nodoc
mixin _$HistoryDateGroup {
  @JsonKey(name: 'DateGroup')
  String get dateGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'PriceData')
  List<HistoryEntry> get priceData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryDateGroupCopyWith<HistoryDateGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryDateGroupCopyWith<$Res> {
  factory $HistoryDateGroupCopyWith(
          HistoryDateGroup value, $Res Function(HistoryDateGroup) then) =
      _$HistoryDateGroupCopyWithImpl<$Res, HistoryDateGroup>;
  @useResult
  $Res call(
      {@JsonKey(name: 'DateGroup') String dateGroup,
      @JsonKey(name: 'PriceData') List<HistoryEntry> priceData});
}

/// @nodoc
class _$HistoryDateGroupCopyWithImpl<$Res, $Val extends HistoryDateGroup>
    implements $HistoryDateGroupCopyWith<$Res> {
  _$HistoryDateGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateGroup = null,
    Object? priceData = null,
  }) {
    return _then(_value.copyWith(
      dateGroup: null == dateGroup
          ? _value.dateGroup
          : dateGroup // ignore: cast_nullable_to_non_nullable
              as String,
      priceData: null == priceData
          ? _value.priceData
          : priceData // ignore: cast_nullable_to_non_nullable
              as List<HistoryEntry>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryDateGroupImplCopyWith<$Res>
    implements $HistoryDateGroupCopyWith<$Res> {
  factory _$$HistoryDateGroupImplCopyWith(_$HistoryDateGroupImpl value,
          $Res Function(_$HistoryDateGroupImpl) then) =
      __$$HistoryDateGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'DateGroup') String dateGroup,
      @JsonKey(name: 'PriceData') List<HistoryEntry> priceData});
}

/// @nodoc
class __$$HistoryDateGroupImplCopyWithImpl<$Res>
    extends _$HistoryDateGroupCopyWithImpl<$Res, _$HistoryDateGroupImpl>
    implements _$$HistoryDateGroupImplCopyWith<$Res> {
  __$$HistoryDateGroupImplCopyWithImpl(_$HistoryDateGroupImpl _value,
      $Res Function(_$HistoryDateGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateGroup = null,
    Object? priceData = null,
  }) {
    return _then(_$HistoryDateGroupImpl(
      dateGroup: null == dateGroup
          ? _value.dateGroup
          : dateGroup // ignore: cast_nullable_to_non_nullable
              as String,
      priceData: null == priceData
          ? _value._priceData
          : priceData // ignore: cast_nullable_to_non_nullable
              as List<HistoryEntry>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryDateGroupImpl implements _HistoryDateGroup {
  const _$HistoryDateGroupImpl(
      {@JsonKey(name: 'DateGroup') required this.dateGroup,
      @JsonKey(name: 'PriceData') required final List<HistoryEntry> priceData})
      : _priceData = priceData;

  factory _$HistoryDateGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryDateGroupImplFromJson(json);

  @override
  @JsonKey(name: 'DateGroup')
  final String dateGroup;
  final List<HistoryEntry> _priceData;
  @override
  @JsonKey(name: 'PriceData')
  List<HistoryEntry> get priceData {
    if (_priceData is EqualUnmodifiableListView) return _priceData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceData);
  }

  @override
  String toString() {
    return 'HistoryDateGroup(dateGroup: $dateGroup, priceData: $priceData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryDateGroupImpl &&
            (identical(other.dateGroup, dateGroup) ||
                other.dateGroup == dateGroup) &&
            const DeepCollectionEquality()
                .equals(other._priceData, _priceData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, dateGroup, const DeepCollectionEquality().hash(_priceData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryDateGroupImplCopyWith<_$HistoryDateGroupImpl> get copyWith =>
      __$$HistoryDateGroupImplCopyWithImpl<_$HistoryDateGroupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryDateGroupImplToJson(
      this,
    );
  }
}

abstract class _HistoryDateGroup implements HistoryDateGroup {
  const factory _HistoryDateGroup(
      {@JsonKey(name: 'DateGroup') required final String dateGroup,
      @JsonKey(name: 'PriceData')
      required final List<HistoryEntry> priceData}) = _$HistoryDateGroupImpl;

  factory _HistoryDateGroup.fromJson(Map<String, dynamic> json) =
      _$HistoryDateGroupImpl.fromJson;

  @override
  @JsonKey(name: 'DateGroup')
  String get dateGroup;
  @override
  @JsonKey(name: 'PriceData')
  List<HistoryEntry> get priceData;
  @override
  @JsonKey(ignore: true)
  _$$HistoryDateGroupImplCopyWith<_$HistoryDateGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
