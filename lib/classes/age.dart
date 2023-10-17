class PostTime {
  final int years;
  final int months;
  final int days;
  final int hours;
  final int minutes;
  final int seconds;

  PostTime({
    required this.years,
    required this.months,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });
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
