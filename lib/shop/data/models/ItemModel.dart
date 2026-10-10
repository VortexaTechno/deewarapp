import 'package:ahlachat/core/utils/app_constance.dart';

class ItemsModel {
  int? id;
  String? name;
  String? svga;
  String? sound;
  String? image;
  int? price;
  int? kind;
  ItemsModel({this.id, this.name,this.price, this.svga, this.sound, this.image,this.kind});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['transname'];
    svga = AppConstance.imageShopUrl(json['svga']);
    sound = json['sound']==null?null: AppConstance.imageShopUrl(json['sound']);
    price=json['price'];
    kind=json['kind'];
    image =AppConstance.imageShopUrl(json['image']??"") ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transname'] = this.name;
    data['svga'] = this.svga;
    data['sound'] = this.sound;
    data['image'] = this.image;
    data['price']= this. price;
    data['kind']  = this.kind;
    return data;
  }
}