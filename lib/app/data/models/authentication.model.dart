class AuthenticationModel {
  String username;
  String password;

  AuthenticationModel({
    required this.username,
    required this.password
  });

  AuthenticationModel.fromJson(
    Map<String, dynamic> json,
    this.username,
    this.password,
  ) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataJson = {};
    dataJson['username'] = username;
    dataJson['password'] = password;
    return dataJson;
  }
}
