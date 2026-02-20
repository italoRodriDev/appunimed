class ProfileModel {
  int? id;

  String? photo;
  String? codUsuario;
  String? nomeUsuario;
  String? setorNome;
  String? telefone;
  String? matricula;
  String? bairro;
  String? cep;
  String? estado;
  String? cidade;
  String? rua;
  String? numero;
  String? data;

  ProfileModel({
    this.id,
    this.photo,
    this.codUsuario,
    this.nomeUsuario,
    this.setorNome,
    this.telefone,
    this.matricula,
    this.cep,
    this.estado,
    this.cidade,
    this.rua,
    this.numero,
    this.data,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    codUsuario = json['codUsuario'];
    nomeUsuario = formatFirstName(json['nomeUsuario'] ?? '');
    setorNome = json['setorNome'];
    telefone = json['telefone'];
    matricula = json['matricula'];
    cep = json['cep'];
    bairro = json['bairro'];
    estado = json['estado'];
    cidade = json['cidade'];
    rua = json['rua'];
    numero = json['numero'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataJson = {};
    dataJson['id'] = id;
    dataJson['photo'] = photo;
    dataJson['codUsuario'] = codUsuario;
    dataJson['nomeUsuario'] = nomeUsuario;
    dataJson['setorNome'] = setorNome;
    dataJson['telefone'] = telefone;
    dataJson['matricula'] = matricula;
    dataJson['cep'] = cep;
    dataJson['estado'] = estado;
    dataJson['cidade'] = cidade;
    dataJson['rua'] = rua;
    dataJson['numero'] = numero;
    dataJson['bairro'] = bairro;
    dataJson['data'] = data;
    return dataJson;
  }

  /// Formata para deixar apenas a primeira letra do primeiro nome em maiúscula
  String formatFirstName(String fullName) {
    if (fullName.trim().isEmpty) return '';

    String firstName = fullName.trim().split(' ').first;
    String firstLetter = firstName[0].toUpperCase();
    String rest = firstName.length > 1
        ? firstName.substring(1).toLowerCase()
        : '';

    return '$firstLetter$rest';
  }
}
