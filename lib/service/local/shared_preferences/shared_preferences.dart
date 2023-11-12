import 'package:astronaut_libraries/classes/encrypt/encrypt.dart';
import 'package:astronaut_libraries/main.dart';

setSharedPreferences(String key, dynamic value) async {
  String text = EncryptData().encrypt(value);
  print('Encrypt $key = $text');
  bool? saveData = await prefs!.setString(key, text);
  print('Set Data In SharedPreferences IS : $saveData');
}

String getSharedPreferences(String key) {
  String? data = prefs!.getString(key);
  String text = EncryptData().decrypt(data!);
  print('Decrypt $key = $text');
  return text;
}

Future<bool> clearSharedPreferences() async {
  bool clean = await prefs!.clear();
  print('Clear Shared Preferences : $clean');
  return clean;
}
