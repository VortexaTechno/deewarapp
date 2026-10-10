
import 'package:ahlachat/shop/data/models/ItemModel.dart';
import 'package:ahlachat/shop/data/models/SalesModel.dart';

class CategoryModel {
  int? id;
  String? name;
  int? packageId;
  List<ItemsModel>? items;

  CategoryModel({this.id, this.name, this.packageId, this.items});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['transname'];
    packageId = json['package_id'];
    if (json['items'] != null) {
      items = <ItemsModel>[];
      json['items'].forEach((v) {
        items!.add(new ItemsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transname'] = this.name;
    data['package_id'] = this.packageId;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




