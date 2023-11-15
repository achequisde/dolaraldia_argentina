import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_entry.freezed.dart';
part 'history_entry.g.dart';

@freezed
class HistoryEntry with _$HistoryEntry {
  const factory HistoryEntry({
    @JsonKey(name: 'Price') required String price,
    @JsonKey(name: 'DatePrice') required String date,
    @JsonKey(name: 'HourPrice') required String hour,
    @JsonKey(name: 'ValuePorcent') required String valuePercent,
    @JsonKey(name: 'ColorText') required String textColor,
    @JsonKey(name: 'IconView') required String icon,
  }) = _HistoryEntry;

  factory HistoryEntry.fromJson(Map<String, Object?> json) =>
      _$HistoryEntryFromJson(json);
}
