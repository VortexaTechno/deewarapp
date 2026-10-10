import 'package:ahlachat/shop/data/models/CategoryModel.dart';

class PackageModel {
  int? id;
  String? name;
  String? kind;
  List<CategoryModel>? category;

  PackageModel({this.id, this.name, this.kind, this.category});

  PackageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['transname'];
    kind = json['kind'];
    if (json['category'] != null) {
      category = <CategoryModel>[];
      json['category'].forEach((v) {
        category!.add(new CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transname'] = this.name;
    data['kind'] = this.kind;
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }



}