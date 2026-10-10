
import 'package:ahlachat/leaderboard/data/models/leaderboardModel.dart';
import 'package:ahlachat/room/data/models/ConstdataModel.dart';
import 'package:ahlachat/room/data/models/RoomModel.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SuccesMessageleaderboardModel extends Equatable {
  bool? statusCode;
  int? errNum;
  String? statusMessage;

  List<leaderboardModel> ? leaderboard;


  SuccesMessageleaderboardModel({this.statusCode, this.errNum,this.leaderboard, this.statusMessage});

  SuccesMessageleaderboardModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status'];
    errNum = json['errNum'];
    statusMessage = json['message'];
    if (json['data']!= null) {
      leaderboard = <leaderboardModel>[];
      json['data'].forEach((v) {
        leaderboard!.add(new leaderboardModel.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.statusCode;
    data['errNum'] = this.errNum;
    data['message'] = this.statusMessage;


    return data;
  }
  @override
  List<Object?> get props => [
    statusCode,
    statusMessage,
    errNum,
    leaderboard
  ];
}



