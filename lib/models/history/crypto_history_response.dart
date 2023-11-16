import 'package:dolaraldia_argentina/models/history/crypto_history_entry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_history_response.freezed.dart';
part 'crypto_history_response.g.dart';

@freezed
class CryptoHistoryResponse with _$CryptoHistoryResponse {
  const factory CryptoHistoryResponse({
    required List<CryptoHistoryEntry> data,
    required int timestamp,
  }) = _CryptoHistoryResponse;

  factory CryptoHistoryResponse.fromJson(Map<String, Object?> json) =>
      _$CryptoHistoryResponseFromJson(json);
}
