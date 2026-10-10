
import 'package:ahlachat/room/data/models/ConstdataModel.dart';
import 'package:ahlachat/room/data/models/RoomModel.dart';

import 'package:equatable/equatable.dart';

class SuccesMessageRoomModel extends Equatable {
  bool? statusCode;
  int? errNum;
  String? statusMessage;
  ConstdataModle ? Constdata;
  List<RoomModel> ? Rooms;


  SuccesMessageRoomModel({this.statusCode, this.errNum,this.Constdata, this.statusMessage});

  SuccesMessageRoomModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status'];
    errNum = json['errNum'];
    statusMessage = json['message'];
    Constdata= json['data'] != null ? new ConstdataModle.fromJson(json['data']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.statusCode;
    data['errNum'] = this.errNum;
    data['message'] = this.statusMessage;
    if (this.Constdata != null) {
      data['data'] = this.Constdata!.toJson();
    }

    return data;
  }
  @override
  List<Object?> get props => [
    statusCode,
    statusMessage,
    errNum,
    Constdata
  ];
}



