// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl _$$ApiResponseImplFromJson(Map<String, dynamic> json) =>
    _$ApiResponseImpl(
      dataBcv: RateData.fromJson(json['DataBcv'] as Map<String, dynamic>),
      dataParalelo:
          RateData.fromJson(json['DataParalelo'] as Map<String, dynamic>),
      dataEuro: RateData.fromJson(json['DataEuro'] as Map<String, dynamic>),
      dataPetro: RateData.fromJson(json['DataPetro'] as Map<String, dynamic>),
      status: json['Status'] as bool,
    );

Map<String, dynamic> _$$ApiResponseImplToJson(_$ApiResponseImpl instance) =>
    <String, dynamic>{
      'DataBcv': instance.dataBcv,
      'DataParalelo': instance.dataParalelo,
      'DataEuro': instance.dataEuro,
      'DataPetro': instance.dataPetro,
      'Status': instance.status,
    };
