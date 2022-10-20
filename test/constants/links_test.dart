import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/constants/links.dart';

void main() {
  test('Telegram link', () {
    expect(ContactLinks.telegram, startsWith('https://t.me/'));
  });

  test('Github link', () {
    expect(ContactLinks.repository, startsWith('https://github.com/'));
  });
}
