// import 'dart:convert';

// import 'package:dolaraldia_ios_test/models/exchange_data.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

// const _cryptoApiUrl = 'api.coincap.io';

// const _cryptoIds = [
//   'bitcoin',
//   'ethereum',
//   'tether',
// ];

// final toVEDecimalPattern = NumberFormat('#,###,##0.00', 'es_VE');

// Future<List<ExchangeData>> getCryptoData() async {
//   final url = Uri.https(
//     _cryptoApiUrl,
//     '/v2/assets',
//     {'ids': _cryptoIds.join(',')},
//   );

//   try {
//     final response = await http.get(url);

//     final List<dynamic> jsonData = jsonDecode(response.body)['data'];

//     return jsonData.map((cryptoData) {
//       var icon = '';
//       var valuePercent = 'n-e';

//       if (cryptoData['changePercent24Hr'] != null) {
//         final valuePercentDouble =
//             double.parse(cryptoData['changePercent24Hr']);
//         valuePercent = switch (valuePercentDouble) {
//           > 0 => '+${toVEDecimalPattern.format(valuePercentDouble)}%',
//           _ => '${toVEDecimalPattern.format(valuePercentDouble)}%',
//         };

//         icon = switch (valuePercent[0]) {
//           '+' => 'ic_up_green',
//           '-' => 'ic_down_red',
//           _ => '',
//         };
//       }

//       final dateNow = DateTime.now().toString();

//       final fechaTemp = dateNow.split(' ')[0];
//       final fechaSplit = fechaTemp.split('-');
//       final date = '${fechaSplit[2]}/${fechaSplit[1]}/${fechaSplit[0]}';

//       final timeTemp = dateNow.split(' ')[1];
//       final timeSplit = timeTemp.split(':');

//       int hora = int.parse(timeSplit[0]);
//       final String suffix;

//       if (hora < 12) {
//         suffix = 'am';
//       } else if (hora == 12) {
//         suffix = 'pm';
//       } else {
//         hora = hora - 12;
//         suffix = 'pm';
//       }

//       final String horaStr;

//       if (hora < 10) {
//         horaStr = '0$hora';
//       } else {
//         horaStr = hora.toString();
//       }

//       final String hour = '$horaStr:${timeSplit[1]} $suffix';

//       final price =
//           toVEDecimalPattern.format(double.parse(cryptoData['priceUsd']));
//       // @Deprecated
//       const textColor = 'Green';

//       return ExchangeData(
//           price: price,
//           date: date,
//           hour: hour,
//           valuePercent: valuePercent,
//           textColor: textColor,
//           icon: icon);
//     }).toList();
//   } catch (_) {
//     rethrow;
//   }
// }
