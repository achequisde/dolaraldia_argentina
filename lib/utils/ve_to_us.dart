import 'package:intl/intl.dart';

final veToUsDecimalFormat = NumberFormat.decimalPattern('es_VE');

num veToUsDecimal(String s) => veToUsDecimalFormat.parse(s);
