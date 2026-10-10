
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:equatable/equatable.dart';

class SuccesMessageUsersModel extends Equatable {
  bool? statusCode;
  int? errNum;
  String? statusMessage;
  List<UserModel>? data;



  SuccesMessageUsersModel({this.statusCode, this.errNum,this.data, this.statusMessage });

  SuccesMessageUsersModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status'];
    errNum = json['errNum'];
    statusMessage = json['message'];
if(json['users']!=null){
  if (json['users']['data'] != null) {
    data = <UserModel>[];
    json['users']['data'].forEach((v) {
      data!.add(new UserModel.fromJson(v));
    });
  }

}

    if (json['data'] != null) {
      data = <UserModel>[];
      json['data'].forEach((v) {
        data!.add(new UserModel.fromJson(v));
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
    data
  ];
}



