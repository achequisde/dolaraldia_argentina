import 'package:dolaraldia_argentina/enums/rate.dart';

String getRateIconPath(Rate rate) {
  return switch (rate) {
    Rate.bcv => 'assets/ic_bcv.png',
    Rate.paralelo => 'assets/ic_paralelo.png',
    Rate.euro => 'assets/ic_euro.png',
    Rate.petro => 'assets/ic_petro.png',
    Rate.btc => 'assets/ic_btc.png',
    Rate.eth => 'assets/ic_eth.png',
    Rate.usdt => 'assets/ic_usdt.png',
  };
}
