enum ThawaniErrorCode { createSessionError, unknown }

class ThawaniError implements Exception {
  final ThawaniErrorCode code;

  const ThawaniError(this.code);
}
