class TeleHealtModel {
  int? id;
  String? title;
  String? type;
  String? date;

  TeleHealtModel({this.id, this.title, this.type, this.date});

  TeleHealtModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['type'] = type;
    data['date'] = date;
    return data;
  }
}
