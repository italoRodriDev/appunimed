class SchedulingModel {
  int? id;
  String? title;
  String? type;
  String? date;

  SchedulingModel({this.id, this.title, this.type, this.date});

  SchedulingModel.fromJson(Map<String, dynamic> json) {
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
