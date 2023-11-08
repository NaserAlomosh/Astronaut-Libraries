import 'package:encrypt/encrypt.dart';

class EncryptData {
  String decrypt(String text) {
    String keyString = '|leaders mindes|';
    final key = Key.fromUtf8(keyString);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(keyString.substring(0, 16));
    return encrypter.decrypt16(text, iv: initVector);
  }

  String encrypt(String plainText) {
    String keyString = '|leaders mindes|';
    final key = Key.fromUtf8(keyString);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(keyString.substring(0, 16));
    Encrypted encryptedData = encrypter.encrypt(plainText, iv: initVector);
    return encryptedData.base16;
  }
}
