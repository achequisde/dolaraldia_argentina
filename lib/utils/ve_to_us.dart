import 'package:intl/intl.dart';

final veToUsDecimalFormat = NumberFormat.decimalPattern('es_VE');
final veToUsDateFormat = DateFormat('dd/MM/yyyy');

num veToUsDecimal(String s) => veToUsDecimalFormat.parse(s);
DateTime veToUsDate(String s) => veToUsDateFormat.parse(s);
