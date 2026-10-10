import 'package:ahlachat/core/utils/app_constance.dart';

class medalModel {
  int? id;
  String? image;
  String? bImage;
  String? tittle;
  String? arTittle;
  String? description;
  String? arDescription;
  String? status;

  medalModel(
      {this.id,
        this.image,
        this.bImage,
        this.tittle,
        this.arTittle,
        this.description,
        this.arDescription,
        this.status});

  medalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image =AppConstance.imageShopUrl(json['image']);
    bImage = AppConstance.imageShopUrl(json['b_image']);
    tittle = json['transtitle'];

    description = json['transdesc'];

    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['b_image'] = this.bImage;
    data['transtitle'] = this.tittle;

    data['transdesc'] = this.description;

    data['status'] = this.status;
    return data;
  }
}