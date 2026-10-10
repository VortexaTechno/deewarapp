import 'package:ahlachat/profile/data/models/medalModel.dart';
import 'package:ahlachat/profile/data/models/mymedalModel.dart';
import 'package:equatable/equatable.dart';

class SuccesMessageMedalModel extends Equatable {
  bool? statusCode;
  int? errNum;
  String? statusMessage;
  List<medalModel>? medal;
  List<mymedalModel>? mymedal;



  SuccesMessageMedalModel({this.statusCode, this.errNum,this.medal,this.mymedal, this.statusMessage});

  SuccesMessageMedalModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status'];
    errNum = json['errNum'];
    statusMessage = json['message'];

    if (json['Medal']['medal'] != null) {
      medal = <medalModel>[];
      json['Medal']['medal'].forEach((v) {
        medal!.add(new medalModel.fromJson(v));
      });
    }
    if (json['Medal']['mymedal'] != null) {
      mymedal = <mymedalModel>[];
      json['Medal']['mymedal'].forEach((v) {
        mymedal!.add(new mymedalModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.statusCode;
    data['errNum'] = this.errNum;
    data['message'] = this.statusMessage;
    if (this.medal != null) {
      data['Medal']['medal'] = this.medal!.map((v) => v.toJson()).toList();
    }
    if (this.mymedal != null) {
      data['Medal']['mymedal'] = this.mymedal!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  @override
  List<Object?> get props => [
    statusCode,
    statusMessage,
    errNum,
    mymedal,
    medal
  ];
}



