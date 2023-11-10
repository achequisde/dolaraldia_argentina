// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RateData _$RateDataFromJson(Map<String, dynamic> json) {
  return _RateData.fromJson(json);
}

/// @nodoc
mixin _$RateData {
  @JsonKey(name: 'PriceNow')
  String get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateNow')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'HourNow')
  String get hour => throw _privateConstructorUsedError;
  @JsonKey(name: 'ValuePorcentNow')
  String get valuePercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'ColorTextNow')
  String get textColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'IconViewNow')
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RateDataCopyWith<RateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateDataCopyWith<$Res> {
  factory $RateDataCopyWith(RateData value, $Res Function(RateData) then) =
      _$RateDataCopyWithImpl<$Res, RateData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PriceNow') String price,
      @JsonKey(name: 'DateNow') String date,
      @JsonKey(name: 'HourNow') String hour,
      @JsonKey(name: 'ValuePorcentNow') String valuePercent,
      @JsonKey(name: 'ColorTextNow') String textColor,
      @JsonKey(name: 'IconViewNow') String icon});
}

/// @nodoc
class _$RateDataCopyWithImpl<$Res, $Val extends RateData>
    implements $RateDataCopyWith<$Res> {
  _$RateDataCopyWithImpl(this._value, this._then);

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
abstract class _$$RateDataImplCopyWith<$Res>
    implements $RateDataCopyWith<$Res> {
  factory _$$RateDataImplCopyWith(
          _$RateDataImpl value, $Res Function(_$RateDataImpl) then) =
      __$$RateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PriceNow') String price,
      @JsonKey(name: 'DateNow') String date,
      @JsonKey(name: 'HourNow') String hour,
      @JsonKey(name: 'ValuePorcentNow') String valuePercent,
      @JsonKey(name: 'ColorTextNow') String textColor,
      @JsonKey(name: 'IconViewNow') String icon});
}

/// @nodoc
class __$$RateDataImplCopyWithImpl<$Res>
    extends _$RateDataCopyWithImpl<$Res, _$RateDataImpl>
    implements _$$RateDataImplCopyWith<$Res> {
  __$$RateDataImplCopyWithImpl(
      _$RateDataImpl _value, $Res Function(_$RateDataImpl) _then)
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
    return _then(_$RateDataImpl(
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
class _$RateDataImpl implements _RateData {
  const _$RateDataImpl(
      {@JsonKey(name: 'PriceNow') required this.price,
      @JsonKey(name: 'DateNow') required this.date,
      @JsonKey(name: 'HourNow') required this.hour,
      @JsonKey(name: 'ValuePorcentNow') required this.valuePercent,
      @JsonKey(name: 'ColorTextNow') required this.textColor,
      @JsonKey(name: 'IconViewNow') required this.icon});

  factory _$RateDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RateDataImplFromJson(json);

  @override
  @JsonKey(name: 'PriceNow')
  final String price;
  @override
  @JsonKey(name: 'DateNow')
  final String date;
  @override
  @JsonKey(name: 'HourNow')
  final String hour;
  @override
  @JsonKey(name: 'ValuePorcentNow')
  final String valuePercent;
  @override
  @JsonKey(name: 'ColorTextNow')
  final String textColor;
  @override
  @JsonKey(name: 'IconViewNow')
  final String icon;

  @override
  String toString() {
    return 'RateData(price: $price, date: $date, hour: $hour, valuePercent: $valuePercent, textColor: $textColor, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateDataImpl &&
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
  _$$RateDataImplCopyWith<_$RateDataImpl> get copyWith =>
      __$$RateDataImplCopyWithImpl<_$RateDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RateDataImplToJson(
      this,
    );
  }
}

abstract class _RateData implements RateData {
  const factory _RateData(
          {@JsonKey(name: 'PriceNow') required final String price,
          @JsonKey(name: 'DateNow') required final String date,
          @JsonKey(name: 'HourNow') required final String hour,
          @JsonKey(name: 'ValuePorcentNow') required final String valuePercent,
          @JsonKey(name: 'ColorTextNow') required final String textColor,
          @JsonKey(name: 'IconViewNow') required final String icon}) =
      _$RateDataImpl;

  factory _RateData.fromJson(Map<String, dynamic> json) =
      _$RateDataImpl.fromJson;

  @override
  @JsonKey(name: 'PriceNow')
  String get price;
  @override
  @JsonKey(name: 'DateNow')
  String get date;
  @override
  @JsonKey(name: 'HourNow')
  String get hour;
  @override
  @JsonKey(name: 'ValuePorcentNow')
  String get valuePercent;
  @override
  @JsonKey(name: 'ColorTextNow')
  String get textColor;
  @override
  @JsonKey(name: 'IconViewNow')
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$RateDataImplCopyWith<_$RateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
