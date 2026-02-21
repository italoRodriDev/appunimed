class ManualModel {
  int? id;
  String? title;
  String? description;

  ManualModel({this.id, this.title, this.description});

  ManualModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
