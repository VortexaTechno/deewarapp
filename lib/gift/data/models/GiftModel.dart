import 'package:ahlachat/core/utils/app_constance.dart';

class GiftModel {
  int? id;
  String? transname;
  String? image;
  String? price;
  String? caId;
  String? svga;
  String?sound;

  GiftModel({this.id, this.transname, this.image, this.price, this.caId, this.svga,this.sound});

  GiftModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transname = json['transname'];
    image =AppConstance.imagegiftsUrl(json['image']) ;
    price = json['price'];
    caId = json['ca_id'];
    svga = AppConstance.imagegiftsUrl(json['svga']) ;
    sound=json['sound']==null?null:AppConstance.imagegiftsUrl(json['sound']) ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transname'] = this.transname;
    data['image'] = this.image;
    data['price'] = this.price;
    data['ca_id'] = this.caId;
    data['svga'] = this.svga;
    data['sound'] = this.sound;
    return data;
  }
}