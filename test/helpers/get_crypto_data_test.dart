import 'package:dolaraldia_argentina/helpers/get_crypto_data.dart';
import 'package:test/test.dart';

void main() {
  group('Crypto data', () {
    test('CryptoResponse should be valid', () async {
      final res = await getCryptoData();

      expect(res, isNotNull);
    });
  });
}
