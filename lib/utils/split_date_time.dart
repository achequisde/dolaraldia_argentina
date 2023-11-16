import 'package:dolaraldia_argentina/utils/us_to_ve.dart';
import 'package:intl/intl.dart';

({String date, String time}) splitDateTime(DateTime datetime) {
  final date = _getDate(datetime);
  final time = _getTime(datetime);

  return (date: date, time: time);
}

_getDate(DateTime datetime) {
  return datetime.toVEDate();
}

_getTime(DateTime datetime) {
  final time = DateFormat.jm().format(datetime).padLeft(8, '0').toLowerCase();
  return time;
}
