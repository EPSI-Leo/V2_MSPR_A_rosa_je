import 'package:meta/meta.dart' show immutable;

@immutable
class ApiClientException implements Exception {
  const ApiClientException({
    required this.code,
    this.message,
    this.innerException,
  });

  /// The error code of the response.
  final int code;

  /// The message returned by the API.
  final String? message;

  /// The exception throwed.
  final Object? innerException;

  @override
  String toString() {
    return 'ApiClientException: message: $message, code: $code, innerException: $innerException';
  }
}
