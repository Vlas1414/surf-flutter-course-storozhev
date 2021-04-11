/// Interface of base exception.
abstract class BaseException implements Exception {
  /// Constructs an instance of [BaseException].
  BaseException(this.message);

  /// Error message.
  late String message;

  /// Get error message.
  String getMessage();

  /// Print error message.
  void printMessage() {
    // ignore: avoid_print
    print(getMessage());
  }
}

/// Unknown exception.
class UnknownException extends BaseException {
  UnknownException(String message) : super(message);

  @override
  String getMessage() {
    return 'Unkown exception: $message';
  }
}

/// Location exception.
class LocationException extends BaseException {
  LocationException(String message) : super(message);

  @override
  String getMessage() {
    return 'Error get location: $message';
  }
}
