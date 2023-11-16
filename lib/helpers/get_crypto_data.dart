import 'package:dio/dio.dart';
import 'package:dolaraldia_argentina/models/crypto/crypto_response.dart';

const _cryptoApiUrl = 'api.coincap.io';

const _cryptoPath = '/v2/assets';

const _cryptoIds = [
  'bitcoin',
  'ethereum',
  'tether',
];

Future<CryptoResponse?> getCryptoData() async {
  final url = Uri.https(
    _cryptoApiUrl,
    _cryptoPath,
    {
      'ids': _cryptoIds.join(','),
    },
  );

  final dio = Dio();

  try {
    final res = await dio.getUri(url);

    return CryptoResponse.fromJson(res.data);
  } catch (_) {
    return null;
  }
}
