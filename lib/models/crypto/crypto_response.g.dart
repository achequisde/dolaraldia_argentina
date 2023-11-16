// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CryptoResponseImpl _$$CryptoResponseImplFromJson(Map<String, dynamic> json) =>
    _$CryptoResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => CryptoRateData.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: json['timestamp'] as int,
    );

Map<String, dynamic> _$$CryptoResponseImplToJson(
        _$CryptoResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'timestamp': instance.timestamp,
    };
