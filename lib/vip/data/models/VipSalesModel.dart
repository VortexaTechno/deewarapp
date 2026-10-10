import 'package:ahlachat/vip/data/models/VipModel.dart';

class VipSalesModel {
  int? id;
  int? vipId;
  int? userId;
  int? days;
  int? status;
  int? deleted;
  String? createdAt;
  String? updatedAt;
  VipModel? vip;

  VipSalesModel(
      {this.id,
        this.vipId,
        this.userId,
        this.days,
        this.status,
        this.deleted,
        this.createdAt,
        this.updatedAt,
        this.vip});

  VipSalesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vipId = json['vip_id'];
    userId = json['user_id'];
    days = json['days'];
    status = json['status'];
    deleted = json['deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    vip = json['vip'] != null ? new VipModel.fromJson(json['vip']) : json['showvip'] != null ? new VipModel.fromJson(json['showvip']) :null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vip_id'] = this.vipId;
    data['user_id'] = this.userId;
    data['days'] = this.days;
    data['status'] = this.status;
    data['deleted'] = this.deleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.vip != null) {
      data['vip'] = this.vip!.toJson();
    }
    return data;
  }
}
