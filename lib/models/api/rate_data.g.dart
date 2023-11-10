// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RateDataImpl _$$RateDataImplFromJson(Map<String, dynamic> json) =>
    _$RateDataImpl(
      price: json['PriceNow'] as String,
      date: json['DateNow'] as String,
      hour: json['HourNow'] as String,
      valuePercent: json['ValuePorcentNow'] as String,
      textColor: json['ColorTextNow'] as String,
      icon: json['IconViewNow'] as String,
    );

Map<String, dynamic> _$$RateDataImplToJson(_$RateDataImpl instance) =>
    <String, dynamic>{
      'PriceNow': instance.price,
      'DateNow': instance.date,
      'HourNow': instance.hour,
      'ValuePorcentNow': instance.valuePercent,
      'ColorTextNow': instance.textColor,
      'IconViewNow': instance.icon,
    };
