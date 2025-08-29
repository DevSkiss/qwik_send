class Failure implements Exception {
  Failure({this.message, this.exception});

  final String? message;
  final Object? exception;
}
