import 'dart:convert';

class OptionModel {
  final int id;
  final String text;
  final int points;

  OptionModel({required this.id, required this.text, required this.points});

  OptionModel copyWith({int? id, String? text, int? points}) {
    return OptionModel(
      id: id ?? this.id,
      text: text ?? this.text,
      points: points ?? this.points,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'text': text, 'points': points};
  }

  factory OptionModel.fromMap(Map<String, dynamic> map) {
    return OptionModel(
      id: map['id'] as int,
      text: map['text'] as String,
      points: map['points'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OptionModel.fromJson(String source) =>
      OptionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OptionModel(id: $id, text: $text, points: $points)';

  @override
  bool operator ==(covariant OptionModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.text == text && other.points == points;
  }

  @override
  int get hashCode => id.hashCode ^ text.hashCode ^ points.hashCode;
}
