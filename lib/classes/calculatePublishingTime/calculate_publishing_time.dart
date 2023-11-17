import 'package:astronaut_libraries/model/post_time/post_time.dart';
import 'package:intl/intl.dart';

String postsTime(String shareTime) {
  DateTime dateTime = DateTime.parse(shareTime);
  PostTime postTime = calculatePublishingTime(dateTime);
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

PostTime calculatePublishingTime(DateTime birthDate) {
  final now = DateTime.now();
  final difference = now.difference(birthDate);
  final years = difference.inDays ~/ 365;
  final months = (difference.inDays % 365) ~/ 30;
  final days = (difference.inDays % 365) % 30;
  final hours = difference.inHours % 24;
  final minutes = difference.inMinutes % 60;
  final seconds = difference.inSeconds % 60;

  return PostTime(
    years: years,
    months: months,
    days: days,
    hours: hours,
    minutes: minutes,
    seconds: seconds,
  );
}
