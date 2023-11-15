import 'package:intl/intl.dart';

final usToVeDecimalFormat = NumberFormat('#,###,##0.00', 'es_VE');
final usToVeDateFormat = DateFormat('dd/MM/yyyy');

String usToVeDecimal(num n) => usToVeDecimalFormat.format(n);
String usToVeDate(DateTime d) => usToVeDateFormat.format(d);

extension UsToVe on DateTime {
  String toVEDate() {
    return usToVeDate(this);
  }
}
