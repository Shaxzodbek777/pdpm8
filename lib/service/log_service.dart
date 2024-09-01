import 'package:logger/logger.dart';

class LogService{
  static final Logger _logger = Logger(
    filter: DevelopmentFilter(),
    printer: PrettyPrinter(),
  );

  static get message => null;

  static void d (String messagge){
    _logger.d(message);
  }
  static void i (String messagge){
    _logger.i(message);
  }
  static void w (String messagge){
    _logger.w(message);
  }
  static void e (String messagge){
    _logger.e(message);
  }
}