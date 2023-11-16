// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CryptoHistoryResponseImpl _$$CryptoHistoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CryptoHistoryResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => CryptoHistoryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: json['timestamp'] as int,
    );

Map<String, dynamic> _$$CryptoHistoryResponseImplToJson(
        _$CryptoHistoryResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'timestamp': instance.timestamp,
    };
