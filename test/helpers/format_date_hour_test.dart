import 'package:dolaraldia_argentina/helpers/format_date_hour.dart';
import 'package:test/test.dart';

void main() {
  group('Format date and hour to create a valid image path', () {
    test('CryptoResponse should be valid', () async {
      const date = '20/10/2023';
      const hour = '05:00 am';

      final dateAndHour = formatDateHour(date: date, hour: hour);

      print(dateAndHour);
    });
  });
}
