import 'package:intl/intl.dart';

final cryptoToUsDecimalFormat = NumberFormat('#,###,##0.000000', 'es_VE');

String cryptoToUsDecimal(num n) => cryptoToUsDecimalFormat.format(n);
