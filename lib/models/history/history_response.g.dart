// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryResponseImpl _$$HistoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$HistoryResponseImpl(
      priceDataHistory: (json['PriceDataHistory'] as List<dynamic>?)
          ?.map((e) => HistoryDateGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HistoryResponseImplToJson(
        _$HistoryResponseImpl instance) =>
    <String, dynamic>{
      'PriceDataHistory': instance.priceDataHistory,
    };
