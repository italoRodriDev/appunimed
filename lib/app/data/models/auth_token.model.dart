

class AuthTokenModel {
  final String? token;
  final int? expiresIn;
  final String? refreshToken;
  final int? refreshExpiresIn;
  final int? operadorId;

  AuthTokenModel({
    this.token,
    this.expiresIn,
    this.refreshToken,
    this.refreshExpiresIn,
    this.operadorId,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    return AuthTokenModel(
      token: json['token'] ?? '',
      expiresIn: json['expiresIn'] ?? 0,
      refreshToken: json['refreshToken'] ?? '',
      refreshExpiresIn: json['refreshExpiresIn'] ?? '',
      operadorId: json['operadorId'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expiresIn': expiresIn,
      'refreshToken': refreshToken,
      'refreshExpiresIn': refreshExpiresIn,
      'operadorId': operadorId,
    };
  }
}
