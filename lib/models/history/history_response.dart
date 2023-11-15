import 'package:dolaraldia_argentina/models/history/history_date_group.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_response.freezed.dart';
part 'history_response.g.dart';

@freezed
class HistoryResponse with _$HistoryResponse {
  const factory HistoryResponse({
    @JsonKey(name: 'PriceDataHistory')
    required List<HistoryDateGroup>? priceDataHistory,
  }) = _HistoryResponse;

  factory HistoryResponse.fromJson(Map<String, Object?> json) =>
      _$HistoryResponseFromJson(json);
}
