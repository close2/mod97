library mod97;

/// Calculates the MOD 97 10 of the passed IBAN as specified in ISO7064.
///
/// If the [source] is not a valid positive integer literal, the [onError]
/// is called with the [source] as argument, and its return value is used
/// instead. If no [onError] is provided, a [FormatException] is thrown.
///
/// The [onError] handler can be chosen to return `null`.  This is preferable
/// to throwing and then immediately catching the [FormatException].
/// Example:
///
///     var value = int.parse(text, onError: (source) => null);
///     if (value == null) ... handle the problem
///
/// The [onError] function is only invoked if [source] is a [String]. It is
/// not invoked if the [source] is, for example, `null`.

int mod97(String source, {int onError(String source)}) {
  if (source.trim().startsWith('-')) {
    if (onError != null) {
      return onError(source);
    }
    throw new FormatException('Only positive numbers are allowed.');
  }
  String remainder = source;
  String block;

  while (remainder.length > 2) {
    block = remainder.length < 9 ? remainder : remainder.substring(0, 9);
    remainder = '${int.parse(block, onError: onError) % 97}${remainder.substring(block.length)}';
  }

  return int.parse(remainder, onError: onError) % 97;
}
