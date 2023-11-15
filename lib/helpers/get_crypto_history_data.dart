// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

// const _cryptoApiUrl = 'api.coincap.io';

// final toVEDecimalPattern = NumberFormat('#,###,##0.00', 'es_VE');

// const intervals = [
//   'm1',
//   'm15',
//   'm30',
//   'h1',
// ];

// final dateF = DateFormat("yyyy-MM-dd");
// final hourF = DateFormat("hh:mm a");

// Future<dynamic> getCryptoHistoryData() async {
//   // TODO: Add guards on SocketException
//   final client = http.Client();

//   Map<String, dynamic> jsonData = {};

//   try {
//     for (final interval in intervals) {
//       final response = await client.get(Uri.https(
//         _cryptoApiUrl,
//         '/v2/assets/bitcoin/history',
//         {'interval': interval},
//       ));

//       final json = jsonDecode(response.body)['data'];
//       jsonData[interval] = json.map(
//         (e) {
//           final dat = DateTime.parse(e['date']);
//           return {
//             'date': dateF.format(dat),
//             'hour': hourF.format(dat),
//             'price': toVEDecimalPattern.format(double.parse(e['priceUsd'])),
//           };
//         },
//       ).toList();
//     }
//   } finally {
//     client.close();
//   }

//   return jsonData;
// }

// Future<dynamic> getEthereumHistoryData() async {
//   final client = http.Client();

//   Map<String, dynamic> jsonData = {};

//   try {
//     for (final interval in intervals) {
//       final response = await client.get(Uri.https(
//         _cryptoApiUrl,
//         '/v2/assets/ethereum/history',
//         {'interval': interval},
//       ));

//       final json = jsonDecode(response.body)['data'];
//       jsonData[interval] = json.map(
//         (e) {
//           final dat = DateTime.parse(e['date']);
//           return {
//             'date': dateF.format(dat),
//             'hour': hourF.format(dat),
//             'price': toVEDecimalPattern.format(double.parse(e['priceUsd'])),
//           };
//         },
//       ).toList();
//     }
//   } finally {
//     client.close();
//   }

//   return jsonData;
// }
