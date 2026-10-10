import 'package:ahlachat/users/data/models/UserModel.dart';

class InboxRoomModel {
  int? id;
  int? senderId;
  int? reciverId;
  int? read;
  String? updatedAt;
  UserModel? user;


  InboxRoomModel(
      {this.id,
        this.senderId,
        this.reciverId,
        this.read,
        this.updatedAt,
        this.user,
         });

  InboxRoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    reciverId = json['reciver_id'];
    read = json['read'];
    updatedAt = json['updated_at'];
    user =json['sender'] != null ? new UserModel.fromJson(json['sender']) : json['reciver'] != null ? new UserModel.fromJson(json['reciver']) :null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sender_id'] = this.senderId;
    data['reciver_id'] = this.reciverId;
    data['read'] = this.read;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['reciver'] = this.user!.toJson();
    }

    return data;
  }
}
