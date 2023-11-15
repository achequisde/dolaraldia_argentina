import 'package:dolaraldia_argentina/utils/get_url.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final _accessKey = dotenv.env['ACCESS_KEY'];
final _accessServer = dotenv.env['ACCESS_SERVER'];
final _accessKeyServer = dotenv.env['ACCESS_KEY_SERVER'];

const url =
    'https://dolaraldia.corpotecguayana.com/apidolaraldiaV2/webservice.php';

final queryParameters = {
  'function': 'Home',
  'access_key': _accessKey,
};

final headers = {
  'content-type': 'application/json',
  'accept': 'application/json',
  'authorization': '$_accessServer $_accessKeyServer',
};

final getApiData = getUrl(
  'https://dolaraldia.corpotecguayana.com/apidolaraldiaV2/webservice.php',
  queryParameters,
  headers,
);
