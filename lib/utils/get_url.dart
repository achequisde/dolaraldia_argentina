import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final _accessKey = dotenv.env['ACCESS_KEY'];
final _accessServer = dotenv.env['ACCESS_SERVER'];
final _accessKeyServer = dotenv.env['ACCESS_KEY_SERVER'];

Future<Map<String, dynamic>> getUrl() async {
  final dio = Dio();
  final res = await dio.get(
    'https://dolaraldia.corpotecguayana.com/apidolaraldiaV2/webservice.php',
    queryParameters: {
      'function': 'Home',
      'access_key': _accessKey,
    },
    options: Options(headers: {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': '$_accessServer $_accessKeyServer',
    }),
  );

  return jsonDecode(res.data);
}
