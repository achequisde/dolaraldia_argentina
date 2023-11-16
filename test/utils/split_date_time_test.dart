import 'package:dolaraldia_argentina/utils/split_date_time.dart';
import 'package:test/test.dart';

void main() async {
  group('Split date and time from datetime', () {
    test('Date should be in es_VE format', () {
      final datetime = DateTime.parse('2023-11-15T13:18:00.000Z');
      final time = splitDateTime(datetime).date;

      expect(time, '15/11/2023');
    });
    test('Time should be in am/pm format', () {
      final datetime = DateTime.parse('2023-11-15T13:18:00.000Z');
      final time = splitDateTime(datetime).time;

      expect(time, '01:18 pm');
    });
    test('Time should be in am/pm format', () {
      final datetime = DateTime.parse('2023-11-15T22:18:00.000Z');
      final time = splitDateTime(datetime).time;

      expect(time, '10:18 pm');
    });
    test('Time should be in am/pm format', () {
      final datetime = DateTime.parse('2023-11-15T01:18:00.000Z');
      final time = splitDateTime(datetime).time;

      expect(time, '01:18 am');
    });
  });
}
