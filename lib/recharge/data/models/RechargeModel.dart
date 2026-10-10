class RechargeModel {
  String? txnId;
  int? userId;
  String? coins;
  String? method;
  double? cost;
  String? createdAt;
  String? updatedAt;

  RechargeModel(
      {this.txnId,
        this.userId,
        this.coins,
        this.method,
        this.cost,
        this.createdAt,
        this.updatedAt});

  RechargeModel.fromJson(Map<String, dynamic> json) {
    txnId = json['txn_id'];
    userId = json['user_id'];
    coins = json['coins'];
    method = json['method'];
    cost = json['cost'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['txn_id'] = this.txnId;
    data['user_id'] = this.userId;
    data['coins'] = this.coins;
    data['method'] = this.method;
    data['cost'] = this.cost;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}