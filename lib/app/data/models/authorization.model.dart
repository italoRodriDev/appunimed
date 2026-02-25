class AuthorizationModel {
  int? id;
  String? solicitante;
  String? beneficiario;
  String? tipoGuia;
  String? protocolo;
  String? numeroGuia;
  String? status;
  String? validade;

  AuthorizationModel({
    this.id,
    this.solicitante,
    this.beneficiario,
    this.tipoGuia,
    this.protocolo,
    this.numeroGuia,
    this.status,
    this.validade,
  });

  AuthorizationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    solicitante = json['solicitante'];
    beneficiario = json['beneficiario'];
    tipoGuia = json['tipoGuia'];
    protocolo = json['protocolo'];
    numeroGuia = json['numeroGuia'];
    status = json['status'];
    validade = json['validade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['solicitante'] = solicitante;
    data['beneficiario'] = beneficiario;
    data['tipoGuia'] = tipoGuia;
    data['protocolo'] = protocolo;
    data['numeroGuia'] = numeroGuia;
    data['status'] = status;
    data['validade'] = validade;
    return data;
  }
}
