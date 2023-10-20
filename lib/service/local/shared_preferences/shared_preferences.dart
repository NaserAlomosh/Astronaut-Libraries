import 'package:astronaut_libraries/main.dart';

setSharedPreferences(String key, dynamic value) async {
  bool? saveData;
  if (value is String) {
    saveData = await prefs!.setString(key, value);
  } else if (value is int) {
    saveData = await prefs!.setInt(key, value);
  } else if (value is double) {
    saveData = await prefs!.setDouble(key, value);
  } else if (value is bool) {
    saveData = await prefs!.setBool(key, value);
  }
  print('Set Shared Preferences is : $saveData {$key : $value}');
}

dynamic getSharedPreferences(String key) {
  dynamic data = prefs!.get(key);
  return data;
}

Future<void> clearSharedPreferences() async {
  bool clean = await prefs!.clear();
  print('Clear Shared Preferences : $clean');
}
