import 'package:dolaraldia_argentina/helpers/get_crypto_history.dart';
import 'package:test/test.dart';

void main() {
  group('Crypto history data', () {
    test('Ethereum history data should be valid', () async {
      final res = await getEthereumHistoryData();

      expect(res, isNotNull);
    });

    test('Bitcoin history data should be valid', () async {
      final res = await getBitcoinHistoryData();

      expect(res, isNotNull);
    });
  });
}
