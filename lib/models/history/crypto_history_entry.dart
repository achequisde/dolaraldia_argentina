import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_history_entry.freezed.dart';
part 'crypto_history_entry.g.dart';

@freezed
class CryptoHistoryEntry with _$CryptoHistoryEntry {
  const factory CryptoHistoryEntry({
    required String priceUsd,
    required String date,
  }) = _CryptoHistoryEntry;

  factory CryptoHistoryEntry.fromJson(Map<String, Object?> json) =>
      _$CryptoHistoryEntryFromJson(json);
}
