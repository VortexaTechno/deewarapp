import 'package:ahlachat/users/data/models/UserModel.dart';

class leaderboardModel {
  int? senderId;
  int? coins;
  UserModel? sender;

  leaderboardModel({this.senderId, this.coins, this.sender});

  leaderboardModel.fromJson(Map<String, dynamic> json) {
    senderId = json['sender_id'];
    coins = json['coins'];
    sender =
    json['sender'] != null ? new UserModel.fromJson(json['sender']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender_id'] = this.senderId;
    data['coins'] = this.coins;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    return data;
  }
}