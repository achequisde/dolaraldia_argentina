// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryEntry _$HistoryEntryFromJson(Map<String, dynamic> json) {
  return _HistoryEntry.fromJson(json);
}

/// @nodoc
mixin _$HistoryEntry {
  @JsonKey(name: 'Price')
  String get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'DatePrice')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'HourPrice')
  String get hour => throw _privateConstructorUsedError;
  @JsonKey(name: 'ValuePorcent')
  String get valuePercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'ColorText')
  String get textColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'IconView')
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryEntryCopyWith<HistoryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryEntryCopyWith<$Res> {
  factory $HistoryEntryCopyWith(
          HistoryEntry value, $Res Function(HistoryEntry) then) =
      _$HistoryEntryCopyWithImpl<$Res, HistoryEntry>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Price') String price,
      @JsonKey(name: 'DatePrice') String date,
      @JsonKey(name: 'HourPrice') String hour,
      @JsonKey(name: 'ValuePorcent') String valuePercent,
      @JsonKey(name: 'ColorText') String textColor,
      @JsonKey(name: 'IconView') String icon});
}

/// @nodoc
class _$HistoryEntryCopyWithImpl<$Res, $Val extends HistoryEntry>
    implements $HistoryEntryCopyWith<$Res> {
  _$HistoryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? date = null,
    Object? hour = null,
    Object? valuePercent = null,
    Object? textColor = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as String,
      valuePercent: null == valuePercent
          ? _value.valuePercent
          : valuePercent // ignore: cast_nullable_to_non_nullable
              as String,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryEntryImplCopyWith<$Res>
    implements $HistoryEntryCopyWith<$Res> {
  factory _$$HistoryEntryImplCopyWith(
          _$HistoryEntryImpl value, $Res Function(_$HistoryEntryImpl) then) =
      __$$HistoryEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Price') String price,
      @JsonKey(name: 'DatePrice') String date,
      @JsonKey(name: 'HourPrice') String hour,
      @JsonKey(name: 'ValuePorcent') String valuePercent,
      @JsonKey(name: 'ColorText') String textColor,
      @JsonKey(name: 'IconView') String icon});
}

/// @nodoc
class __$$HistoryEntryImplCopyWithImpl<$Res>
    extends _$HistoryEntryCopyWithImpl<$Res, _$HistoryEntryImpl>
    implements _$$HistoryEntryImplCopyWith<$Res> {
  __$$HistoryEntryImplCopyWithImpl(
      _$HistoryEntryImpl _value, $Res Function(_$HistoryEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? date = null,
    Object? hour = null,
    Object? valuePercent = null,
    Object? textColor = null,
    Object? icon = null,
  }) {
    return _then(_$HistoryEntryImpl(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as String,
      valuePercent: null == valuePercent
          ? _value.valuePercent
          : valuePercent // ignore: cast_nullable_to_non_nullable
              as String,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryEntryImpl implements _HistoryEntry {
  const _$HistoryEntryImpl(
      {@JsonKey(name: 'Price') required this.price,
      @JsonKey(name: 'DatePrice') required this.date,
      @JsonKey(name: 'HourPrice') required this.hour,
      @JsonKey(name: 'ValuePorcent') required this.valuePercent,
      @JsonKey(name: 'ColorText') required this.textColor,
      @JsonKey(name: 'IconView') required this.icon});

  factory _$HistoryEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryEntryImplFromJson(json);

  @override
  @JsonKey(name: 'Price')
  final String price;
  @override
  @JsonKey(name: 'DatePrice')
  final String date;
  @override
  @JsonKey(name: 'HourPrice')
  final String hour;
  @override
  @JsonKey(name: 'ValuePorcent')
  final String valuePercent;
  @override
  @JsonKey(name: 'ColorText')
  final String textColor;
  @override
  @JsonKey(name: 'IconView')
  final String icon;

  @override
  String toString() {
    return 'HistoryEntry(price: $price, date: $date, hour: $hour, valuePercent: $valuePercent, textColor: $textColor, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryEntryImpl &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.valuePercent, valuePercent) ||
                other.valuePercent == valuePercent) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, price, date, hour, valuePercent, textColor, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryEntryImplCopyWith<_$HistoryEntryImpl> get copyWith =>
      __$$HistoryEntryImplCopyWithImpl<_$HistoryEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryEntryImplToJson(
      this,
    );
  }
}

abstract class _HistoryEntry implements HistoryEntry {
  const factory _HistoryEntry(
          {@JsonKey(name: 'Price') required final String price,
          @JsonKey(name: 'DatePrice') required final String date,
          @JsonKey(name: 'HourPrice') required final String hour,
          @JsonKey(name: 'ValuePorcent') required final String valuePercent,
          @JsonKey(name: 'ColorText') required final String textColor,
          @JsonKey(name: 'IconView') required final String icon}) =
      _$HistoryEntryImpl;

  factory _HistoryEntry.fromJson(Map<String, dynamic> json) =
      _$HistoryEntryImpl.fromJson;

  @override
  @JsonKey(name: 'Price')
  String get price;
  @override
  @JsonKey(name: 'DatePrice')
  String get date;
  @override
  @JsonKey(name: 'HourPrice')
  String get hour;
  @override
  @JsonKey(name: 'ValuePorcent')
  String get valuePercent;
  @override
  @JsonKey(name: 'ColorText')
  String get textColor;
  @override
  @JsonKey(name: 'IconView')
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$HistoryEntryImplCopyWith<_$HistoryEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
