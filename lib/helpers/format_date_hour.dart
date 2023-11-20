// This is for Screenshots
import 'package:intl/intl.dart';

({String date, String hour}) formatDateHour(
    {required String date, required String hour}) {
  // Slashes are not valid in paths
  final String formattedDate = DateFormat('yyyy-MM-dd').format(
    DateFormat('dd/MM/yyyy').parse(date),
  );

  // Remove colons and spaces, e.g. '04:30 am' to '04-30-am'
  final String formattedHour = hour.replaceAll(RegExp(r':|\s'), '-');

  return (
    date: formattedDate,
    hour: formattedHour,
  );
}

String formatHour(String hour) {
  final String formattedHour = hour.replaceAll(RegExp(r':|\s'), '-');

  return formattedHour;
}
