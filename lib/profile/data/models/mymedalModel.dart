import 'package:ahlachat/profile/data/models/medalModel.dart';

class mymedalModel {
  int? id;
  int? medalId;
  int? userId;
  medalModel? medal;

  mymedalModel({this.id, this.medalId, this.userId, this.medal});

  mymedalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medalId = json['medal_id'];
    userId = json['user_id'];
    medal = json['medal'] != null ? new medalModel.fromJson(json['medal']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['medal_id'] = this.medalId;
    data['user_id'] = this.userId;
    if (this.medal != null) {
      data['medal'] = this.medal!.toJson();
    }
    return data;
  }
}