import 'package:logging/logging.dart';

class LoggerHelper {
  static final LoggerHelper _instance = LoggerHelper._internal();

  final log = Logger('Provider');

  factory LoggerHelper() {
    return _instance;
  }

  LoggerHelper._internal();
}
