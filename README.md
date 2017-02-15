# mod97

Calculates the MOD 97 10 of the passed number as specified in ISO7064.

Only positive numbers are allowed.

I have copied this code from [iban.js](https://github.com/arhs/iban.js)

![Build Status](https://travis-ci.org/close2/mod97.svg?branch=master)

## Usage

A simple usage example:

    import 'package:mod97/mod97.dart';

    main() {
      int m = mod97('1234567');
      
      int m2 = mod97('-123', onError: (_) => 5);
      // m2 will be 5
    }

The input must be a `String`.  Returned value is an `int`eger.

Invalid characters throw a `FormatException` unless an `onError`
function is provided.

