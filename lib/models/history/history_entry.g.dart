// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryEntryImpl _$$HistoryEntryImplFromJson(Map<String, dynamic> json) =>
    _$HistoryEntryImpl(
      price: json['Price'] as String,
      date: json['DatePrice'] as String,
      hour: json['HourPrice'] as String,
      valuePercent: json['ValuePorcent'] as String,
      textColor: json['ColorText'] as String,
      icon: json['IconView'] as String,
    );

Map<String, dynamic> _$$HistoryEntryImplToJson(_$HistoryEntryImpl instance) =>
    <String, dynamic>{
      'Price': instance.price,
      'DatePrice': instance.date,
      'HourPrice': instance.hour,
      'ValuePorcent': instance.valuePercent,
      'ColorText': instance.textColor,
      'IconView': instance.icon,
    };
