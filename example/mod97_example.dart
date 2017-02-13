import 'package:mod97/mod97.dart';

int main() {
  final hugeNumber = '12345678901234567890';
  int mod = mod97(hugeNumber);
  print('The modulos 97 of $hugeNumber is: $mod');
  return 0;
}
