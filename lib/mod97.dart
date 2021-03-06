library mod97;

/// Calculates the MOD 97 10 of the passed IBAN as specified in ISO7064.
///
/// If the [source] is not a valid positive integer literal, the [onError]
/// is called with the [source] as argument, and its return value is used
/// instead. If no [onError] is provided, a [FormatException] is thrown.
///
/// The [onError] handler can be chosen to return for instance `-1`.
/// This is preferable to throwing and then immediately catching the
/// [FormatException].
///
/// Example:
///     var value = int.parse(text, onError: (source) => -1);
///     if (value == -1) ... handle the problem
int mod97(String source, {int onError(String source)?}) {
  if (source.trim().startsWith('-')) {
    if (onError != null) {
      return onError(source);
    }
    throw new FormatException('Only positive numbers are allowed.');
  }

  final parseF = onError == null ? int.parse : int.tryParse;

  String remainder = source;
  String block;

  while (remainder.length > 2) {
    block = remainder.length < 9 ? remainder : remainder.substring(0, 9);
    final parsedBlock = parseF(block);
    if (parsedBlock == null) {
      return onError!(source);
    }
    remainder = '${parsedBlock % 97}${remainder.substring(block.length)}';
  }

  final parsedRemainder = parseF(remainder);
  if (parsedRemainder == null) {
    return onError!(source);
  }
  return parsedRemainder % 97;
}
