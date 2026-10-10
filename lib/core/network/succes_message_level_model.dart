
import 'package:ahlachat/profile/data/models/levelModel.dart';

import 'package:equatable/equatable.dart';

class SuccesMessageLevelModel extends Equatable {
  bool? statusCode;
  int? errNum;
  String? statusMessage;
  List<LevelModel>? Wealth;
  List<LevelModel>? Income;



  SuccesMessageLevelModel({this.statusCode, this.errNum,this.Wealth,this.Income ,this.statusMessage});

  SuccesMessageLevelModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status'];
    errNum = json['errNum'];
    statusMessage = json['message'];

    if (json['level']['wealth'] != null) {
      Wealth = <LevelModel>[];
      json['level']['wealth'].forEach((v) {
        Wealth!.add(new LevelModel.fromJson(v));
      });
    }
    if (json['level']['Icnome'] != null) {
      Income = <LevelModel>[];
      json['level']['Icnome'].forEach((v) {
        Income!.add(new LevelModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.statusCode;
    data['errNum'] = this.errNum;
    data['message'] = this.statusMessage;
    if (this.Wealth != null) {
      data['level']['wealth'] = this.Wealth!.map((v) => v.toJson()).toList();
    }
    if (this.Income != null) {
      data['level']['Icnome'] = this.Income!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  @override
  List<Object?> get props => [
    statusCode,
    statusMessage,
    errNum,
    Income,Wealth
  ];
}



