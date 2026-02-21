class FoundModel {
  int? id;
  String? title;
  String? value;
  String? date;

  FoundModel({this.id, this.title, this.value, this.date});

  FoundModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    value = json['value'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['value'] = value;
    data['date'] = date;
    return data;
  }
}
