
import 'package:ahlachat/userprofile/data/models/ProfileImageModel.dart';

import 'package:equatable/equatable.dart';

class SuccesMessageUserProfileImageModel extends Equatable {
  bool? statusCode;
  int? errNum;
  String? statusMessage;

  ProfileImageModel ? data;


  SuccesMessageUserProfileImageModel({this.statusCode, this.errNum,  this.statusMessage,this.data});

  SuccesMessageUserProfileImageModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status'];
    errNum = json['errNum'];
    statusMessage = json['message'];
    data= json['data'] != null ? new ProfileImageModel.fromJson(json['data']) : null;

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



