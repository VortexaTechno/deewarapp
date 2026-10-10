import 'package:ahlachat/users/data/models/FireBaseGoogleModel.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:equatable/equatable.dart';

class SuccesMessageModel extends Equatable {
  bool? statusCode;
  int? errNum;
  String? statusMessage;
  String?image;
  TokenData? data;
  FireBaseGoogleModel? FirebaseAuth;

  SuccesMessageModel({this.statusCode, this.errNum,this.data, this.statusMessage,this.FirebaseAuth});

  SuccesMessageModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status'];
    errNum = json['errNum'];
    statusMessage = json['message'];
    data = json['data'] != null ? new TokenData.fromJson(json['data']) : null;
    image= json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.statusCode;
    data['errNum'] = this.errNum;
    data['message'] = this.statusMessage;
    data['image']=this.image;
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
  ];
}

class TokenData extends Equatable{
  String? accessToken;
  String? tokenType;
  UserModel?UserInfo;
  int? expiresIn;
  List<UserModel>? users;
  TokenData({this.accessToken, this.tokenType, this.expiresIn,this.users});

  TokenData.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    UserInfo = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
    if (json['users'] != null) {
      users = <UserModel>[];
      json['users'].forEach((v) {
        users!.add(new UserModel.fromJson(v));
      });
    }


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  @override
  List<Object?> get props => [
    accessToken,
    tokenType,
    expiresIn,
    UserInfo,
    users
  ];
}

