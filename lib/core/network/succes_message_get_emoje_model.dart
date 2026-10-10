
import 'package:ahlachat/chairs/data/model/emojeModel.dart';

import 'package:equatable/equatable.dart';

class SuccesMessageEmojesModel extends Equatable {
  bool? statusCode;
  int? errNum;
  String? statusMessage;

  List<EmojeAssetModel> ? Emojes;


  SuccesMessageEmojesModel({this.statusCode, this.errNum,this.Emojes, this.statusMessage});

  SuccesMessageEmojesModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status'];
    errNum = json['errNum'];
    statusMessage = json['message'];
    if (json['data'] != null) {
      Emojes = <EmojeAssetModel>[];
      json['data'].forEach((v) {
        Emojes!.add(new EmojeAssetModel.fromJson(v));
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
    Emojes
  ];
}



