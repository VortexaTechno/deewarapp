
import 'package:ahlachat/room/data/models/ConstdataModel.dart';
import 'package:ahlachat/room/data/models/RoomModel.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SuccesMessageRoomsMembersModel extends Equatable {
  bool? statusCode;
  int? errNum;
  String? statusMessage;

  List<UserModel> ? users;


  SuccesMessageRoomsMembersModel({this.statusCode, this.errNum,this.users, this.statusMessage});

  SuccesMessageRoomsMembersModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status'];
    errNum = json['errNum'];
    statusMessage = json['message'];
    if (json['data']['data'] != null) {
      users = <UserModel>[];
      json['data']['data'].forEach((v) {
        users!.add(new UserModel.fromJson(v['user']));
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
    users
  ];
}



