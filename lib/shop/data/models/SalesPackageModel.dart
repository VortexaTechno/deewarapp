import 'package:ahlachat/shop/data/models/SalesCategoryModel.dart';

class SalesPackageModel {
  int? id;
  String? name;
  String? kind;
  List<SalesCategoryModel>? category;

  SalesPackageModel({this.id, this.name, this.kind, this.category});

  SalesPackageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['transname'];
    kind = json['kind'];
    if (json['category'] != null) {
      category = <SalesCategoryModel>[];
      json['category'].forEach((v) {
        category!.add(new SalesCategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['kind'] = this.kind;
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}