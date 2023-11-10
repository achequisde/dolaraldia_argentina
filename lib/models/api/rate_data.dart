import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_data.freezed.dart';
part 'rate_data.g.dart';

@freezed
class RateData with _$RateData {
  const factory RateData({
    @JsonKey(name: 'PriceNow') required String price,
    @JsonKey(name: 'DateNow') required String date,
    @JsonKey(name: 'HourNow') required String hour,
    @JsonKey(name: 'ValuePorcentNow') required String valuePercent,
    @JsonKey(name: 'ColorTextNow') required String textColor,
    @JsonKey(name: 'IconViewNow') required String icon,
  }) = _RateData;

  factory RateData.fromJson(Map<String, Object?> json) =>
      _$RateDataFromJson(json);
}
