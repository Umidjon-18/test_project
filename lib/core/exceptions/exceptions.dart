class ServerException implements Exception {
  final String errorMessage;
  final int statusCode;
  const ServerException({required this.statusCode, required this.errorMessage});

  @override
  String toString() {
    return 'ServerException(statusCode: $statusCode, errorMessage: $errorMessage)';
  }
}

//
class DioExceptions implements Exception {}

class ParsingException implements Exception {
  final String errorMessage;

  const ParsingException({required this.errorMessage});
}
