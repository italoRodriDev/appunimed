import 'dart:io';

class ChatModel {
  int? id;
  String? text;
  int? isMe;
  List<File>? files;

  ChatModel({this.id, this.text, this.isMe, this.files});

  ChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    isMe = json['isMe'];
    files = json['files'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['text'] = text;
    data['isMe'] = isMe;
    data['files'] = files;
    return data;
  }
}
