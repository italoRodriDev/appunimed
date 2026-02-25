class ExamsResultModel {
  int? id;
  String date;
  String description;
  String url;

  ExamsResultModel({this.id, required this.date, required this.url, required this.description});

  factory ExamsResultModel.fromJson(Map<String, dynamic> json) {
    return ExamsResultModel(
      id: json['id'],
      url: json['url'] ?? '',
      date: json['date'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'url': url, 'date': date, 'description': description};
  }
}
