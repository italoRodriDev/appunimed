class MedicalGuideModel {
  int? id;
  String? nome;
  String? especialidade;
  String? crm;
  String? endereco;
  String? tipo;
  String? telefone;
  String? whatsapp;
  String? localizacao;
  String? cidade;
  String? bairro;

  MedicalGuideModel({
    this.id,
    this.nome,
    this.especialidade,
    this.crm,
    this.endereco,
    this.tipo,
    this.telefone,
    this.whatsapp,
    this.localizacao,
    this.cidade,
    this.bairro
  });

  MedicalGuideModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    especialidade = json['especialidade'];
    crm = json['crm'];
    endereco = json['endereco'];
    tipo = json['tipo'];
    telefone = json['telefone'];
    whatsapp = json['whatsapp'];
    localizacao = json['localizacao'];
    cidade = json['cidade'];
    bairro = json['bairro'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'especialidade': especialidade,
      'crm': crm,
      'endereco': endereco,
      'tipo': tipo,
      'telefone': telefone,
      'whatsapp': whatsapp,
      'localizacao': localizacao,
      'cidade': cidade,
      'bairro': bairro,
    };
  }
}