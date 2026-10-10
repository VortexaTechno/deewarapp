import 'package:ahlachat/gift/data/models/GiftModel.dart';

class GiftCategoryModel {
  int? id;
  String? transname;
  List<GiftModel>? gift;

  GiftCategoryModel({this.id, this.transname, this.gift});

  GiftCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transname = json['transname'];
    if (json['gift'] != null) {
      gift = <GiftModel>[];
      json['gift'].forEach((v) {
        gift!.add(new GiftModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transname'] = this.transname;
    if (this.gift != null) {
      data['gift'] = this.gift!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}