class CalcAiringTimeCount {
  // ignore: missing_return
  String set(String dateTimeStr){
    DateTime time = DateTime.parse(dateTimeStr);
    DateTime now  = DateTime.now();
    Duration diff = time.difference(now);

    if (!diff.isNegative) {
      if (diff.inMinutes <= 60) {
        return diff.inMinutes.toString() + "分";
      } else if (diff.inHours <= 24) {
        return diff.inHours.toString() + "時間";
      } else if (diff.inDays <= 30) {
        return diff.inDays.toString() + "日";
      }
    } else {
      return "待機中";
    }
  }
}