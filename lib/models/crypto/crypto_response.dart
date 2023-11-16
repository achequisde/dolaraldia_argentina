import 'package:dolaraldia_argentina/models/crypto/crypto_rate_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_response.freezed.dart';
part 'crypto_response.g.dart';

@freezed
class CryptoResponse with _$CryptoResponse {
  const factory CryptoResponse({
    required List<CryptoRateData> data,
    required int timestamp,
  }) = _CryptoResponse;

  factory CryptoResponse.fromJson(Map<String, Object?> json) =>
      _$CryptoResponseFromJson(json);
}
