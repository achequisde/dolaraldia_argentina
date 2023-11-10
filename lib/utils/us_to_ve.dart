import 'package:intl/intl.dart';

final usToVeDecimalFormat = NumberFormat('#,###,##0.00', 'es_VE');

String usToVeDecimal(num n) => usToVeDecimalFormat.format(n);
