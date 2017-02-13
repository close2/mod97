library mod97_tests;

import 'package:mod97/mod97.dart';
import 'package:test/test.dart';

part 'mod97_generated_tests.dart';

void main() {
  group('A group of tests', () {
    test('Empty string', () {
      expect(() => mod97(''), throwsFormatException);
    });
    test('Negative number', () {
      expect(() => mod97('-123456'), throwsFormatException);
    });
    test('Invalid string containing non numeric characters', () {
      expect(() => mod97(''), throwsFormatException);
    });
    test('Numbers starting with a lot of 0s', () {
      expect(mod97('000000000000000000000000000012372943127471237294312747'), 87);
    });
  });

  testGenerated();
}
