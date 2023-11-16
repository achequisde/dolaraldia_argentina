// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_rate_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CryptoRateDataImpl _$$CryptoRateDataImplFromJson(Map<String, dynamic> json) =>
    _$CryptoRateDataImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      priceUsd: json['priceUsd'] as String,
      changePercent24Hr: json['changePercent24Hr'] as String?,
    );

Map<String, dynamic> _$$CryptoRateDataImplToJson(
        _$CryptoRateDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'priceUsd': instance.priceUsd,
      'changePercent24Hr': instance.changePercent24Hr,
    };
