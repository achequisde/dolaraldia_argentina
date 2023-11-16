import 'package:dolaraldia_argentina/enums/rate.dart';
import 'package:dolaraldia_argentina/models/crypto/crypto_rate_data.dart';
import 'package:dolaraldia_argentina/models/crypto/crypto_response.dart';

CryptoRateData getCurrentCryptoData(CryptoResponse data, Rate rate) {
  return switch (rate) {
    Rate.btc => data.data[0],
    Rate.eth => data.data[1],
    Rate.usdt => data.data[2],
    _ => data.data[0],
  };
}
