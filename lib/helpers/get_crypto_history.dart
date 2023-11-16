import 'package:dio/dio.dart';
import 'package:dolaraldia_argentina/enums/crypto_history_time_period.dart';
import 'package:dolaraldia_argentina/models/history/crypto_history_response.dart';

const _cryptoApiUrl = 'api.coincap.io';
const _cryptoEthereumPath = '/v2/assets/ethereum/history';
const _cryptoBitcoinPath = '/v2/assets/bitcoin/history';

final getBitcoinHistoryData = createGetCryptoHistoryData(_cryptoBitcoinPath);
final getEthereumHistoryData = createGetCryptoHistoryData(_cryptoEthereumPath);

Future<List<CryptoHistoryResponse>?> Function() createGetCryptoHistoryData(
    String path) {
  return () async {
    final dio = Dio();

    final responses = <CryptoHistoryResponse>[];

    try {
      for (final interval in CryptoHistoryTimePeriod.values) {
        final response = await dio.getUri(Uri.https(
          _cryptoApiUrl,
          path,
          {'interval': interval.name},
        ));

        responses.add(
          CryptoHistoryResponse.fromJson(response.data),
        );
      }
    } catch (error) {
      print('$error');
      return null;
    } finally {
      dio.close();
    }

    return responses;
  };
}
