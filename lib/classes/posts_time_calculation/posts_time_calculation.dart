import 'package:intl/intl.dart';

String postsTimeCalculation(String shareTime) {
  DateTime dateTime = DateTime.parse(shareTime);
  return DateFormat.yMMMd().format(dateTime);
}
  // DateTime now = DateTime.now();
  // Duration difference = now.difference(dateTime);
  // //
  // int days = difference.inDays + 1;
  // int hours = now.difference(dateTime).inHours + 1;
  // int minutes = now.difference(dateTime).inMinutes + 1;
  // int seconds = now.difference(dateTime).inSeconds + 1;
  // //Start Cheak
  // print('days : $days');
  // print('hours : $hours');
  // print('minutes : $minutes');
  // print('seconds : $seconds');
  // print('###################');
  // if (days > 365) {
  //   print('years ');
  //   return DateFormat.yMMMd().format(dateTime);
  // } else if (days > 30 && days <= 350) {
  //   print('months');
  //   return '${DateFormat.MMMd().format(dateTime)} ago';
  // } else if (days > 1 && days <= 30) {
  //   print('day');
  //   return 'days${DateFormat.d().format(dateTime)} ago';
  // } else if (hours <= 24 && hours >= 1) {
  //   print('hours');
  //   return 'h${DateFormat.H().format(dateTime)} ago';
  // } else if (minutes <= 59 && minutes >= 1) {
  //   print('minutes');
  //   return 'min${DateFormat.m().format(dateTime)} ago';
  // } else {
  //   print('seconds');
  //   return 'sec ${DateFormat.s().format(dateTime)} ago';
  // }
