// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_date_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryDateGroupImpl _$$HistoryDateGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$HistoryDateGroupImpl(
      dateGroup: json['DateGroup'] as String,
      priceData: (json['PriceData'] as List<dynamic>)
          .map((e) => HistoryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HistoryDateGroupImplToJson(
        _$HistoryDateGroupImpl instance) =>
    <String, dynamic>{
      'DateGroup': instance.dateGroup,
      'PriceData': instance.priceData,
    };
