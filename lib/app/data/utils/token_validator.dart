import 'package:app_colabora_unimedjp/app/data/keys/shared_preferences.keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InvalidTokenException implements Exception {
  final String message;
  InvalidTokenException(this.message);
}

class TokenValidator {
  static Future<Map<String, String>> getHeaders({
    bool skipAuthorization = false,
    String? token,
  }) async {
    final baseHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (skipAuthorization) {
      return baseHeaders;
    }

    String? finalToken = token;

    if (finalToken == null) {
      final sp = await SharedPreferences.getInstance();
      finalToken = sp.getString(TOKEN_KEY);
    }

    if (finalToken == null || finalToken.isEmpty) {
      throw InvalidTokenException("Token não encontrado.");
    }

    return {
      ...baseHeaders,
      'Authorization': 'Bearer $finalToken',
    };
  }
}
