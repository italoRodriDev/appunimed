class BrasilCepModel {
  final String cep;
  final String logradouro;
  final String complemento;
  final String unidade;
  final String bairro;
  final String localidade;
  final String uf;
  final String estado;
  final String regiao;
  final String ibge;
  final String gia;
  final String ddd;
  final String siafi;

  BrasilCepModel({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.unidade,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.estado,
    required this.regiao,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  factory BrasilCepModel.fromJson(Map<String, dynamic> json) {
    return BrasilCepModel(
      cep: json['cep'] ?? '',
      logradouro: json['street'] ?? '',
      complemento: '', // BrasilAPI não retorna
      unidade: '', // BrasilAPI não retorna
      bairro: json['neighborhood'] ?? '',
      localidade: json['city'] ?? '',
      uf: json['state'] ?? '',
      estado: json['state'] ?? '',
      regiao: '', // não retorna
      ibge: '', // endpoint /cep/v1 não retorna
      gia: '',
      ddd: '',
      siafi: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'estado': estado,
    };
  }
}
