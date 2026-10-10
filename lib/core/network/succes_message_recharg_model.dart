import 'package:ahlachat/recharge/data/models/ExchangeModel.dart';
import 'package:ahlachat/recharge/data/models/RechargeModel.dart';
import 'package:equatable/equatable.dart';

class SuccesMessageRechargeModel extends Equatable {
  bool? statusCode;
  int? errNum;
  String? statusMessage;
  List<RechargeModel>? data;
  List<ExchangeModel>?  Exchange;



  SuccesMessageRechargeModel({this.statusCode, this.errNum,this.data, this.statusMessage,this.Exchange});

  SuccesMessageRechargeModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status'];
    errNum = json['errNum'];
    statusMessage = json['message'];

    if (json['Recharge'] != null) {
      data = <RechargeModel>[];
      json['Recharge'].forEach((v) {
        data!.add(new RechargeModel.fromJson(v));
      });
    }
    if (json['Exchange'] != null) {
      Exchange = <ExchangeModel>[];
      json['Exchange'].forEach((v) {
        Exchange!.add(new ExchangeModel.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.statusCode;
    data['errNum'] = this.errNum;
    data['message'] = this.statusMessage;
    if (this.data != null) {
      data['Recharge'] = this.data!.map((v) => v.toJson()).toList();
    }

    if (this.Exchange != null) {
      data['Exchange'] = this.Exchange!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  @override
  List<Object?> get props => [
    statusCode,
    statusMessage,
    errNum,
    data,
    Exchange
  ];
}



