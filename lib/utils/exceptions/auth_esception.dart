class AuthException implements Exception {
  // the error message
  final String _message;

  AuthException({required int code, required String message})
      : _message = message;
  // get the corresponding error message

  @override
  String toString() {
    return _message;
  }
}
