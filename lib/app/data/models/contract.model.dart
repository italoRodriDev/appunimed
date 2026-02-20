class ContractModel {
  final int? id;
  final String? codigo;
  final String? nome;
  final String? cpf;
  final String? categoriaSigla;
  final String? categoria;
  final int? pessoaId;
  final int? contratoId;
  final String? contratoCodigo;

  ContractModel({
    this.id,
    this.codigo,
    this.nome,
    this.cpf,
    this.categoriaSigla,
    this.categoria,
    this.pessoaId,
    this.contratoId,
    this.contratoCodigo,
  });

  factory ContractModel.fromJson(Map<String, dynamic> map) => ContractModel(
    id: map['id'],
    codigo: map['codigo'],
    nome: map['nome'],
    cpf: map['cpf'],
    categoriaSigla: map['categoriaSigla'],
    categoria: map['categoria'],
    pessoaId: map['pessoaId'],
    contratoId: map['contratoId'],
    contratoCodigo: map['contratoCodigo'],
  );

  Map<String, dynamic> toJson() => {
    'id': id ?? '',
    'codigo': codigo ?? '',
    'nome': nome ?? '',
    'cpf': cpf ?? '',
    'categoriaSigla': categoriaSigla ?? '',
    'categoria': categoria ?? '',
    'pessoaId': pessoaId ?? 0,
    'contratoId': contratoId ?? 0,
    'contratoCodigo': contratoCodigo ?? '',
  };
}
