
import 'package:ahlachat/room/data/models/ConstdataModel.dart';
import 'package:ahlachat/room/data/models/RoomModel.dart';

import 'package:equatable/equatable.dart';

class SuccesMessageRoomsModel extends Equatable {
  bool? statusCode;
  int? errNum;
  String? statusMessage;

  List<RoomModel> ? Rooms;


  SuccesMessageRoomsModel({this.statusCode, this.errNum,this.Rooms, this.statusMessage});

  SuccesMessageRoomsModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status'];
    errNum = json['errNum'];
    statusMessage = json['message'];
    if (json['room']['data'] != null) {
      Rooms = <RoomModel>[];
      json['room']['data'].forEach((v) {
        Rooms!.add(new RoomModel.fromJson(v));
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
    Rooms
  ];
}



