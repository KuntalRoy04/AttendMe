import 'dart:math';

String generateSecretCode(int length) {
  const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  String result = '';

  for (int i = 0; i < length; i++) {
    result += chars[random.nextInt(chars.length)];
  }

  return result;
}