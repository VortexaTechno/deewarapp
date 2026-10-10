
import 'package:ahlachat/vip/data/models/VipModel.dart';
import 'package:ahlachat/vip/data/models/VipSalesModel.dart';
import 'package:equatable/equatable.dart';

class SuccesMessageVipShopModel extends Equatable {
  bool? statusCode;
  int? errNum;
  String? statusMessage;
  List<VipModel>? Vip;
  List<VipSalesModel>? Sales;



  SuccesMessageVipShopModel({this.statusCode, this.errNum,this.Vip, this.statusMessage});

  SuccesMessageVipShopModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status'];
    errNum = json['errNum'];
    statusMessage = json['message'];

    if (json['Vip']['shop'] != null) {
      Vip = <VipModel>[];
      json['Vip']['shop'].forEach((v) {
        Vip!.add(new VipModel.fromJson(v));
      });
    }
    if (json['Vip']['mysales'] != null) {
      Sales = <VipSalesModel>[];
      json['Vip']['mysales'].forEach((v) {
        Sales!.add(new VipSalesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.statusCode;
    data['errNum'] = this.errNum;
    data['message'] = this.statusMessage;
    if (this.Vip != null) {
      data['Vip']['shop'] = this.Vip!.map((v) => v.toJson()).toList();
    }
    if (this.Sales != null) {
      data['Vip']['mysales'] = this.Sales!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  @override
  List<Object?> get props => [
    statusCode,
    statusMessage,
    errNum,
    Vip
  ];
}



