
import 'package:ahlachat/chairs/data/model/emojeModel.dart';
import 'package:ahlachat/roomchat/data/models/InboxRoomModel.dart';

import 'package:equatable/equatable.dart';

class SuccesMessageInboxModel extends Equatable {
  bool? statusCode;
  int? errNum;
  String? statusMessage;

  List<InboxRoomModel> ? Inbox;


  SuccesMessageInboxModel({this.statusCode, this.errNum,this.Inbox, this.statusMessage});

  SuccesMessageInboxModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status'];
    errNum = json['errNum'];
    statusMessage = json['message'];
    if (json['data'] != null) {
      Inbox = <InboxRoomModel>[];
      json['data'].forEach((v) {
        Inbox!.add(new InboxRoomModel.fromJson(v));
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
    Inbox
  ];
}



