class ServerException implements Exception {
  String? message;
  int? statusCode;

  ServerException({
    this.message,
    this.statusCode,
  });
}

class SignUpException implements Exception {
  String? message;
  int? code;
  int? count;
  int? limit;
  String? limitMobileNumber;

  SignUpException({
    this.message,
    this.code,
    this.count,
    this.limit,
    this.limitMobileNumber,
  });
}

class NoInternetException implements Exception {}

class CacheException implements Exception {}
