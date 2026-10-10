
import 'package:ahlachat/room/data/models/RoomModel.dart';


import 'package:equatable/equatable.dart';

class SuccesMessageJoinRoomModel extends Equatable {
  bool? statusCode;
  int? errNum;
  String? statusMessage;

  RoomModel ? data;


  SuccesMessageJoinRoomModel({this.statusCode, this.errNum,  this.statusMessage,this.data});

  SuccesMessageJoinRoomModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status'];
    errNum = json['errNum'];
    statusMessage = json['message'];
    data= json['data'] != null ? new RoomModel.fromJson(json['data']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.statusCode;
    data['errNum'] = this.errNum;
    data['message'] = this.statusMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
  @override
  List<Object?> get props => [
    statusCode,
    statusMessage,
    errNum,
    data
  ];
}



