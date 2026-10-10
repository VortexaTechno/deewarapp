import 'package:ahlachat/shop/data/models/SalesModel.dart';

class SalesCategoryModel {
  int? id;
  String? name;
  int? packageId;
  List<SalesModel>? sales;

  SalesCategoryModel({this.id, this.name, this.packageId, this.sales});

  SalesCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['transname'];
    packageId = json['package_id'];
    if (json['sales'] != null) {
      sales = <SalesModel>[];
      json['sales'].forEach((v) {
        sales!.add(new SalesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['package_id'] = this.packageId;
    if (this.sales != null) {
      data['sales'] = this.sales!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
