import 'dart:convert';

import 'package:dio/dio.dart';

Future<Map<String, dynamic>> Function() getUrl(String url,
    Map<String, String?> queryParameters, Map<String, String> headers) {
  return () async {
    final dio = Dio();
    final res = await dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );

    return jsonDecode(res.data);
  };
}
