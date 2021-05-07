import 'package:intl/intl.dart';

class DateTimeFormat {
  static String onFormat(String dateTimeStr){
    DateTime time = DateTime.parse(dateTimeStr);
    DateFormat formatter = new DateFormat('MM/dd HH:mm a');
    return formatter.format(time);
  }
}