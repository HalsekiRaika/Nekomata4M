import 'package:intl/intl.dart';

class DateTimeFormat {
  String set(String dateTimeStr){
    DateTime time = DateTime.parse(dateTimeStr);
    DateFormat formatter = new DateFormat('MM/dd HH:mm:ss');
    return formatter.format(time);
  }
}