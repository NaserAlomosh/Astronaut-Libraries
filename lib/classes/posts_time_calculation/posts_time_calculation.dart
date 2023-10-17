import 'package:intl/intl.dart';

import '../age.dart';

String postsTimeCalculation(String shareTime) {
  DateTime dateTime = DateTime.parse(shareTime);
  PostTime postTime = calculatePublishingTime(dateTime);
  print('years ${postTime.years}');
  print('days ${postTime.days}');
  print('hours ${postTime.hours}');
  print('minutes ${postTime.minutes}');
  print('seconds ${postTime.seconds}');
  if (postTime.years == 0) {
    if (postTime.months == 0) {
      if (postTime.days == 0) {
        if (postTime.hours == 0) {
          if (postTime.minutes == 0) {
            if (postTime.seconds == 1) {
              return 'now';
            } else {
              return '${postTime.seconds} seconds ago';
            }
          } else {
            return '${postTime.minutes} minutes ago';
          }
        } else {
          return '${postTime.hours} hours ago';
        }
      } else {
        return '${postTime.days} days ago';
      }
    } else {
      return DateFormat.MMMd().format(dateTime);
    }
  } else {
    return DateFormat.yMMMd().format(dateTime);
  }
}
