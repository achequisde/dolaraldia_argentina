import 'package:dolaraldia_argentina/models/history/history_entry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_date_group.freezed.dart';
part 'history_date_group.g.dart';

@freezed
class HistoryDateGroup with _$HistoryDateGroup {
  const factory HistoryDateGroup({
    @JsonKey(name: 'DateGroup') required String dateGroup,
    @JsonKey(name: 'PriceData') required List<HistoryEntry> priceData,
  }) = _HistoryDateGroup;

  factory HistoryDateGroup.fromJson(Map<String, Object?> json) =>
      _$HistoryDateGroupFromJson(json);
}
