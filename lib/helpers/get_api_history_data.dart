import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dolaraldia_argentina/enums/history_rate.dart';
import 'package:dolaraldia_argentina/models/history/history_response.dart';
import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const _url =
    'https://dolaraldia.corpotecguayana.com/apidolaraldiaV2/webservice.php';

final _accessKey = dotenv.env['ACCESS_KEY'];
final _accessServer = dotenv.env['ACCESS_SERVER'];
final _accessKeyServer = dotenv.env['ACCESS_KEY_SERVER'];

final _queryParameters = {
  'function': 'History',
  'access_key': _accessKey,
};

final _headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': '$_accessServer $_accessKeyServer',
};

Future<HistoryResponse?> getApiHistoryData(
  HistoryRate rate,
  DateTime startDate,
  DateTime endDate,
) async {
  final String dateRangeStart = startDate.toVEDate();
  final String dateRangeEnd = endDate.toVEDate();

  print(dateRangeStart);
  print(dateRangeEnd);

  final String rateName = rate.name;

  final body = {
    'select': rateName,
    'dateFirst': dateRangeStart,
    'dateEnd': dateRangeEnd,
    'AccessKeyConfirm': _accessKey,
  };

  final dio = Dio();

  try {
    final response = await dio.post(
      _url,
      queryParameters: _queryParameters,
      data: body,
      options: Options(
        headers: _headers,
      ),
    );

    final historyResponse = HistoryResponse.fromJson(jsonDecode(response.data));

    return historyResponse;
  } catch (_) {
    return null;
  }
}
