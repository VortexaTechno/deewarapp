class ExchangeModel {
  int? id;
  int? userId;
  int? userBeans;
  int? coins;
  int? beans;
  String? createdAt;
  String? updatedAt;

  ExchangeModel(
      {this.id,
        this.userId,
        this.userBeans,
        this.coins,
        this.beans,
        this.createdAt,
        this.updatedAt});

  ExchangeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userBeans = json['user_beans'];
    coins = json['coins'];
    beans = json['beans'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_beans'] = this.userBeans;
    data['coins'] = this.coins;
    data['beans'] = this.beans;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}