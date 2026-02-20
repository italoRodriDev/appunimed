import 'package:app_colabora_unimedjp/app/data/models/auth_token.model.dart';
import 'package:app_colabora_unimedjp/app/data/models/contract.model.dart';

class AuthResponseModel {
  final int id;
  final String codigo;
  final String nome;
  final String cpf;
  final String categoriaSigla;
  final String categoria;
  final int pessoaId;
  final int contratoId;
  final String contratoCodigo;
  final List<ContractModel>? contratos;
  final AuthTokenModel? authBeneficiarioToken;

  AuthResponseModel({
    required this.id,
    required this.codigo,
    required this.nome,
    required this.cpf,
    required this.categoriaSigla,
    required this.categoria,
    required this.pessoaId,
    required this.contratoId,
    required this.contratoCodigo,
    this.contratos,
    this.authBeneficiarioToken,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      id: json['id'] ?? 0,
      codigo: json['codigo'] ?? '',
      nome: json['nome'] ?? '',
      cpf: json['cpf'] ?? '',
      categoriaSigla: json['categoriaSigla'] ?? '',
      categoria: json['categoria'] ?? '',
      pessoaId: json['pessoaId'] ?? 0,
      contratoId: json['contratoId'] ?? 0,
      contratoCodigo: json['contratoCodigo'] ?? '',
      contratos: _parseContracts(json['contratos']),
      authBeneficiarioToken: json['authBeneficiarioToken'] != null
          ? AuthTokenModel.fromJson(json['authBeneficiarioToken'])
          : null,
    );
  }

  static List<ContractModel> _parseContracts(dynamic data) {
    if (data == null || data is! List) return [];

    return data
        .map((item) => ContractModel.fromJson(item))
        .toList();
  }

  factory AuthResponseModel.fromJsonSqlite(Map<String, dynamic> json) {
    return AuthResponseModel(
      id: json['id'] ?? 0,
      codigo: json['codigo'] ?? '',
      nome: json['nome'] ?? '',
      cpf: json['cpf'] ?? '',
      categoriaSigla: json['categoriaSigla'] ?? '',
      categoria: json['categoria'] ?? '',
      pessoaId: json['pessoaId'] ?? 0,
      contratoId: json['contratoId'] ?? 0,
      contratoCodigo: json['contratoCodigo'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'codigo': codigo,
      'nome': nome,
      'cpf': cpf,
      'categoriaSigla': categoriaSigla,
      'categoria': categoria,
      'pessoaId': pessoaId,
      'contratoId': contratoId,
      'contratoCodigo': contratoCodigo,
      'contratos': contratos?.map((c) => c.toJson()).toList(),
      'authBeneficiarioToken': authBeneficiarioToken?.toJson(),
    };
  }

  Map<String, dynamic> toJsonSqlite() {
    return {
      'id': id,
      'codigo': codigo,
      'nome': nome,
      'cpf': cpf,
      'categoriaSigla': categoriaSigla,
      'categoria': categoria,
      'pessoaId': pessoaId,
      'contratoId': contratoId,
      'contratoCodigo': contratoCodigo,
    };
  }
}
