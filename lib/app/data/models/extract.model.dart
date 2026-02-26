

class ExtractModel {
  int? id;
  String? title;
  String? url;
  String? ano;
  String? mes;

  ExtractModel({this.id, this.title, this.url, this.ano, this.mes});

  ExtractModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    ano = json['ano'];
    mes = json['mes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['ano'] = ano;
    data['mes'] = mes;
    return data;
  }
}
