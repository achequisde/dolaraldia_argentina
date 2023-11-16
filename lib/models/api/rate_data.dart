import 'package:dolaraldia_argentina/models/crypto/crypto_rate_data.dart';
import 'package:dolaraldia_argentina/utils/split_date_time.dart';
import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
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

  factory RateData.fromCryptoRateData(CryptoRateData cryptoRateData, int timestamp) {
    final usPrice = double.parse(cryptoRateData.priceUsd);
    final price = usToVeDecimal(usPrice);

    final (date: date, time: hour) = splitDateTime(DateTime.fromMillisecondsSinceEpoch(timestamp));

    late final String valuePercent;

    if (cryptoRateData.changePercent24Hr != null) {
      final doubleValuePercent = double.parse(cryptoRateData.changePercent24Hr!);

      valuePercent = switch (doubleValuePercent) {
        > 0 => '+${usToVeDecimal(doubleValuePercent)}%',
        _ => '${usToVeDecimal(doubleValuePercent)}%'
      };
    } else {
      valuePercent = 'n-e';
    }

    const textColor = 'Green';

    final icon = switch (valuePercent[0]) {
      '+' => 'ic_up_green',
      '-' => 'ic_down_red',
      _ => '',
    };

    return RateData(
      price: price,
      date: date,
      hour: hour,
      valuePercent: valuePercent,
      textColor: textColor,
      icon: icon,
    );
  }
}
