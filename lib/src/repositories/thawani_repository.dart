import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';

class ThawaniRepository {
  const ThawaniRepository({
    ThawaniConfig config = const ThawaniConfigUAT(
      publishableKey: 'HGvTMLDssJghr9tlN9gr4DVYt0qyBy',
      secretKey: 'rRQ26GcsZzoEhbrP2HZvLYDbn9C9et',
    ),
  }) : _config = config;

  final ThawaniConfig _config;

  Future<String> createSession({
    required Map<String, dynamic> payload,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("${_config.domain}/api/v1/checkout/session"),
        body: jsonEncode(payload),
        headers: {
          "Content-Type": "application/json",
          'thawani-api-key': _config.secretKey,
        },
      );

      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final sessionId = body["data"]["session_id"];
        return '${_config.domain}/pay/$sessionId?key=${_config.publishableKey}';
      } else {
        throw const ThawaniError(ThawaniErrorCode.createSessionError);
      }
    } catch (err) {
      rethrow;
    }
  }
}
