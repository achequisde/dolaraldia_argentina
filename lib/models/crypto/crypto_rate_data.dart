import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_rate_data.freezed.dart';
part 'crypto_rate_data.g.dart';

@freezed
class CryptoRateData with _$CryptoRateData {
  const factory CryptoRateData({
    required String id,
    required String name,
    required String priceUsd,
    required String? changePercent24Hr,
  }) = _CryptoRateData;

  factory CryptoRateData.fromJson(Map<String, Object?> json) =>
      _$CryptoRateDataFromJson(json);
}
