class Appexceptions implements Exception {
  final String? _message;
  final String? _prefix;

  Appexceptions([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message$_prefix';
  }
}

class FetchDataExceptions extends Appexceptions {
  FetchDataExceptions([String? message])
      : super(message, "Error during Communication");
}

class BadrequestException extends Appexceptions {
  BadrequestException([String? message]) : super(message, "Invalid request");
}

class UnauthorizedException extends Appexceptions {
  UnauthorizedException([String? message])
      : super(message, "Unauthorized request");
}
