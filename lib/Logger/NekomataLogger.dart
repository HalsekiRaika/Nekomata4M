import 'package:intl/intl.dart';

class _ClientMsg {
  final String information = "Info";
  final String caution     = "Caut";
  final String warning     = "Warn";
  final String error       = "Err ";
}

// It will be Deprecated. XP

class NekomataLogger {
  void printInfo(String status, String msg) {
    _logger(_ClientMsg().information, status, msg);
  }

  void printCaut(String status, String msg) {
    _logger(_ClientMsg().caution, status, msg);
  }

  void printWarn(String status, String msg) {
    _logger(_ClientMsg().warning, status, msg);
  }

  void printErr (String status, String msg) {
    _logger(_ClientMsg().error, status, msg);
  }

  void _logger(String icwe,String status, String msg) {
    print("[ $icwe ] " +
        "[ ${DateFormat('MM/dd/yyyy HH:mm:ss').format(DateTime.now())} ] " +
        "[ $status ] $msg");
  }
}