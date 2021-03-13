import 'package:intl/intl.dart';

class _ClientMsg {
  final String information = "Info";
  final String caution     = "Caut";
  final String warning     = "Warn";
  final String error       = "Err ";
}

// It will be Deprecated. XP

class Logger {
  static void printInfo(String status, String msg) {
    _logger(_ClientMsg().information, status.padRight(16), msg);
  }

  static void printCaut(String status, String msg) {
    _logger(_ClientMsg().caution, status.padRight(16), msg);
  }

  static void printWarn(String status, String msg) {
    _logger(_ClientMsg().warning, status.padRight(16), msg);
  }

  static void printErr (String status, String msg) {
    _logger(_ClientMsg().error, status.padRight(16), msg);
  }

  static void _logger(String icwe,String status, String msg) {
    print("$icwe: " +
        "${DateFormat('MM-dd HH:mm:ss').format(DateTime.now())}: " +
        "$status:: $msg");
  }

  static Future<void> asyncPrintInfo(String status, String msg) async {
    _asyncLogger(_ClientMsg().information, status.padRight(16), msg);
  }

  static Future<void> asyncPrintCaut(String status, String msg) async {
    _asyncLogger(_ClientMsg().caution, status.padRight(16), msg);
  }

  static Future<void> asyncPrintWarn(String status, String msg) async {
    _asyncLogger(_ClientMsg().warning, status.padRight(16), msg);
  }

  static Future<void> asyncPrintErr (String status, String msg) async {
    _asyncLogger(_ClientMsg().error, status.padRight(16), msg);
  }

  static Future<void> _asyncLogger(String icwe,String status, String msg) async {
    print("$icwe: " +
        "${DateFormat('MM-dd HH:mm:ss').format(DateTime.now())}: " +
        "$status:: $msg");
  }
}