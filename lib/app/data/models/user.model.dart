class UserModel {
  int id;
  String usuario;
  String password;

  UserModel({required this.id, required this.usuario, required this.password});

  UserModel.fromJson(
    Map<String, dynamic> json,
    this.id,
    this.usuario,
    this.password,
  ) {
    id = json['id'];
    usuario = json['usario'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataJson = {};
    dataJson['id'] = id;
    dataJson['usuario'] = usuario;
    dataJson['password'] = password;
    return dataJson;
  }
}
